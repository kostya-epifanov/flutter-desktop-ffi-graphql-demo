import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// GraphQL client configured for Bitquery's streaming API.
class BitqueryGraphQLClient {
  BitqueryGraphQLClient({
    String? apiKey,
    String endpoint = 'https://streaming.bitquery.io/graphql',
  })  : _apiKey = apiKey ?? dotenv.env['BITQUERY_API_KEY'],
        _endpoint = endpoint;

  final String? _apiKey;
  final String _endpoint;

  GraphQLClient? _client;

  GraphQLClient get _instance {
    _client ??= _createClient();
    return _client!;
  }

  GraphQLClient _createClient() {
    final apiKey = _requireApiKey();
    final httpLink = HttpLink(_endpoint);
    final authLink = AuthLink(getToken: () async => 'Bearer $apiKey');
    final link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  String _requireApiKey() {
    final key = _apiKey;
    if (key == null || key.isEmpty || key == 'your_key_here') {
      throw BitqueryException(
        'Bitquery API key not configured. Copy .env.example to .env and set BITQUERY_API_KEY.',
      );
    }
    return key;
  }

  /// Ensures the API key is valid. Call before making requests.
  void ensureApiKey() {
    _requireApiKey();
  }

  /// Executes a GraphQL query. Throws [BitqueryException] on API key, network, or GraphQL errors.
  Future<Map<String, dynamic>> query(
    DocumentNode document, {
    Map<String, dynamic>? variables,
    FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
  }) async {
    _requireApiKey();

    final result = await _instance.query(
      QueryOptions(
        document: document,
        variables: variables ?? const {},
        fetchPolicy: fetchPolicy,
      ),
    );

    if (result.hasException) {
      final ex = result.exception!;
      final msg = ex.graphqlErrors.isNotEmpty
          ? ex.graphqlErrors.first.message
          : (ex.linkException?.toString() ?? ex.toString());
      throw BitqueryException('GraphQL error: $msg');
    }

    final data = result.data;
    if (data == null) {
      throw BitqueryException('No data in response');
    }

    return data;
  }
}

/// Thrown when Bitquery API requests fail.
class BitqueryException implements Exception {
  BitqueryException(this.message);

  final String message;

  @override
  String toString() => 'BitqueryException: $message';
}
