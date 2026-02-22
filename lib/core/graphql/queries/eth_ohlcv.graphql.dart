import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter_desktop_ffi_graphql_demo/core/graphql/queries/scalars.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$EthOhlcv {
  factory Variables$Query$EthOhlcv({
    required String currencyId,
    required int duration,
    required int limit,
    required int daysAgo,
  }) => Variables$Query$EthOhlcv._({
    r'currencyId': currencyId,
    r'duration': duration,
    r'limit': limit,
    r'daysAgo': daysAgo,
  });

  Variables$Query$EthOhlcv._(this._$data);

  factory Variables$Query$EthOhlcv.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$currencyId = data['currencyId'];
    result$data['currencyId'] = (l$currencyId as String);
    final l$duration = data['duration'];
    result$data['duration'] = (l$duration as int);
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$daysAgo = data['daysAgo'];
    result$data['daysAgo'] = (l$daysAgo as int);
    return Variables$Query$EthOhlcv._(result$data);
  }

  Map<String, dynamic> _$data;

  String get currencyId => (_$data['currencyId'] as String);

  int get duration => (_$data['duration'] as int);

  int get limit => (_$data['limit'] as int);

  int get daysAgo => (_$data['daysAgo'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$currencyId = currencyId;
    result$data['currencyId'] = l$currencyId;
    final l$duration = duration;
    result$data['duration'] = l$duration;
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$daysAgo = daysAgo;
    result$data['daysAgo'] = l$daysAgo;
    return result$data;
  }

  CopyWith$Variables$Query$EthOhlcv<Variables$Query$EthOhlcv> get copyWith =>
      CopyWith$Variables$Query$EthOhlcv(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$EthOhlcv ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$currencyId = currencyId;
    final lOther$currencyId = other.currencyId;
    if (l$currencyId != lOther$currencyId) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$daysAgo = daysAgo;
    final lOther$daysAgo = other.daysAgo;
    if (l$daysAgo != lOther$daysAgo) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$currencyId = currencyId;
    final l$duration = duration;
    final l$limit = limit;
    final l$daysAgo = daysAgo;
    return Object.hashAll([l$currencyId, l$duration, l$limit, l$daysAgo]);
  }
}

abstract class CopyWith$Variables$Query$EthOhlcv<TRes> {
  factory CopyWith$Variables$Query$EthOhlcv(
    Variables$Query$EthOhlcv instance,
    TRes Function(Variables$Query$EthOhlcv) then,
  ) = _CopyWithImpl$Variables$Query$EthOhlcv;

  factory CopyWith$Variables$Query$EthOhlcv.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$EthOhlcv;

  TRes call({String? currencyId, int? duration, int? limit, int? daysAgo});
}

class _CopyWithImpl$Variables$Query$EthOhlcv<TRes>
    implements CopyWith$Variables$Query$EthOhlcv<TRes> {
  _CopyWithImpl$Variables$Query$EthOhlcv(this._instance, this._then);

  final Variables$Query$EthOhlcv _instance;

  final TRes Function(Variables$Query$EthOhlcv) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? currencyId = _undefined,
    Object? duration = _undefined,
    Object? limit = _undefined,
    Object? daysAgo = _undefined,
  }) => _then(
    Variables$Query$EthOhlcv._({
      ..._instance._$data,
      if (currencyId != _undefined && currencyId != null)
        'currencyId': (currencyId as String),
      if (duration != _undefined && duration != null)
        'duration': (duration as int),
      if (limit != _undefined && limit != null) 'limit': (limit as int),
      if (daysAgo != _undefined && daysAgo != null) 'daysAgo': (daysAgo as int),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$EthOhlcv<TRes>
    implements CopyWith$Variables$Query$EthOhlcv<TRes> {
  _CopyWithStubImpl$Variables$Query$EthOhlcv(this._res);

  TRes _res;

  call({String? currencyId, int? duration, int? limit, int? daysAgo}) => _res;
}

class Query$EthOhlcv {
  Query$EthOhlcv({this.Trading, this.$__typename = 'Query'});

  factory Query$EthOhlcv.fromJson(Map<String, dynamic> json) {
    final l$Trading = json['Trading'];
    final l$$__typename = json['__typename'];
    return Query$EthOhlcv(
      Trading: l$Trading == null
          ? null
          : Query$EthOhlcv$Trading.fromJson(
              (l$Trading as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$EthOhlcv$Trading? Trading;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Trading = Trading;
    _resultData['Trading'] = l$Trading?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Trading = Trading;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Trading, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$EthOhlcv || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Trading = Trading;
    final lOther$Trading = other.Trading;
    if (l$Trading != lOther$Trading) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$EthOhlcv on Query$EthOhlcv {
  CopyWith$Query$EthOhlcv<Query$EthOhlcv> get copyWith =>
      CopyWith$Query$EthOhlcv(this, (i) => i);
}

abstract class CopyWith$Query$EthOhlcv<TRes> {
  factory CopyWith$Query$EthOhlcv(
    Query$EthOhlcv instance,
    TRes Function(Query$EthOhlcv) then,
  ) = _CopyWithImpl$Query$EthOhlcv;

  factory CopyWith$Query$EthOhlcv.stub(TRes res) =
      _CopyWithStubImpl$Query$EthOhlcv;

  TRes call({Query$EthOhlcv$Trading? Trading, String? $__typename});
  CopyWith$Query$EthOhlcv$Trading<TRes> get Trading;
}

class _CopyWithImpl$Query$EthOhlcv<TRes>
    implements CopyWith$Query$EthOhlcv<TRes> {
  _CopyWithImpl$Query$EthOhlcv(this._instance, this._then);

  final Query$EthOhlcv _instance;

  final TRes Function(Query$EthOhlcv) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? Trading = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$EthOhlcv(
          Trading: Trading == _undefined
              ? _instance.Trading
              : (Trading as Query$EthOhlcv$Trading?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$EthOhlcv$Trading<TRes> get Trading {
    final local$Trading = _instance.Trading;
    return local$Trading == null
        ? CopyWith$Query$EthOhlcv$Trading.stub(_then(_instance))
        : CopyWith$Query$EthOhlcv$Trading(
            local$Trading,
            (e) => call(Trading: e),
          );
  }
}

class _CopyWithStubImpl$Query$EthOhlcv<TRes>
    implements CopyWith$Query$EthOhlcv<TRes> {
  _CopyWithStubImpl$Query$EthOhlcv(this._res);

  TRes _res;

  call({Query$EthOhlcv$Trading? Trading, String? $__typename}) => _res;

  CopyWith$Query$EthOhlcv$Trading<TRes> get Trading =>
      CopyWith$Query$EthOhlcv$Trading.stub(_res);
}

const documentNodeQueryEthOhlcv = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'EthOhlcv'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'currencyId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'duration')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'limit')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'daysAgo')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'Trading'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'Currencies'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                      name: NameNode(value: 'where'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'Currency'),
                            value: ObjectValueNode(
                              fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'Id'),
                                  value: ObjectValueNode(
                                    fields: [
                                      ObjectFieldNode(
                                        name: NameNode(value: 'is'),
                                        value: VariableNode(
                                          name: NameNode(value: 'currencyId'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'Interval'),
                            value: ObjectValueNode(
                              fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'Time'),
                                  value: ObjectValueNode(
                                    fields: [
                                      ObjectFieldNode(
                                        name: NameNode(value: 'Duration'),
                                        value: ObjectValueNode(
                                          fields: [
                                            ObjectFieldNode(
                                              name: NameNode(value: 'eq'),
                                              value: VariableNode(
                                                name: NameNode(
                                                  value: 'duration',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'Block'),
                            value: ObjectValueNode(
                              fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'Time'),
                                  value: ObjectValueNode(
                                    fields: [
                                      ObjectFieldNode(
                                        name: NameNode(value: 'since_relative'),
                                        value: ObjectValueNode(
                                          fields: [
                                            ObjectFieldNode(
                                              name: NameNode(value: 'days_ago'),
                                              value: VariableNode(
                                                name: NameNode(
                                                  value: 'daysAgo',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'limit'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'count'),
                            value: VariableNode(name: NameNode(value: 'limit')),
                          ),
                        ],
                      ),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'orderBy'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'descending'),
                            value: EnumValueNode(
                              name: NameNode(value: 'Block_Time'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'Block'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'Timestamp'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: 'Volume'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'Usd'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: 'Price'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'Ohlc'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'Open'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'High'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'Low'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'Close'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                ],
                              ),
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$EthOhlcv _parserFn$Query$EthOhlcv(Map<String, dynamic> data) =>
    Query$EthOhlcv.fromJson(data);
typedef OnQueryComplete$Query$EthOhlcv =
    FutureOr<void> Function(Map<String, dynamic>?, Query$EthOhlcv?);

class Options$Query$EthOhlcv extends graphql.QueryOptions<Query$EthOhlcv> {
  Options$Query$EthOhlcv({
    String? operationName,
    required Variables$Query$EthOhlcv variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$EthOhlcv? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$EthOhlcv? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$EthOhlcv(data),
               ),
         onError: onError,
         document: documentNodeQueryEthOhlcv,
         parserFn: _parserFn$Query$EthOhlcv,
       );

  final OnQueryComplete$Query$EthOhlcv? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$EthOhlcv
    extends graphql.WatchQueryOptions<Query$EthOhlcv> {
  WatchOptions$Query$EthOhlcv({
    String? operationName,
    required Variables$Query$EthOhlcv variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$EthOhlcv? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryEthOhlcv,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$EthOhlcv,
       );
}

class FetchMoreOptions$Query$EthOhlcv extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$EthOhlcv({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$EthOhlcv variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryEthOhlcv,
       );
}

extension ClientExtension$Query$EthOhlcv on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$EthOhlcv>> query$EthOhlcv(
    Options$Query$EthOhlcv options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$EthOhlcv> watchQuery$EthOhlcv(
    WatchOptions$Query$EthOhlcv options,
  ) => this.watchQuery(options);

  void writeQuery$EthOhlcv({
    required Query$EthOhlcv data,
    required Variables$Query$EthOhlcv variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryEthOhlcv),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$EthOhlcv? readQuery$EthOhlcv({
    required Variables$Query$EthOhlcv variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryEthOhlcv),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$EthOhlcv.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$EthOhlcv> useQuery$EthOhlcv(
  Options$Query$EthOhlcv options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$EthOhlcv> useWatchQuery$EthOhlcv(
  WatchOptions$Query$EthOhlcv options,
) => graphql_flutter.useWatchQuery(options);

class Query$EthOhlcv$Widget extends graphql_flutter.Query<Query$EthOhlcv> {
  Query$EthOhlcv$Widget({
    widgets.Key? key,
    required Options$Query$EthOhlcv options,
    required graphql_flutter.QueryBuilder<Query$EthOhlcv> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$EthOhlcv$Trading {
  Query$EthOhlcv$Trading({this.Currencies, this.$__typename = 'Trading'});

  factory Query$EthOhlcv$Trading.fromJson(Map<String, dynamic> json) {
    final l$Currencies = json['Currencies'];
    final l$$__typename = json['__typename'];
    return Query$EthOhlcv$Trading(
      Currencies: (l$Currencies as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$EthOhlcv$Trading$Currencies.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$EthOhlcv$Trading$Currencies?>? Currencies;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Currencies = Currencies;
    _resultData['Currencies'] = l$Currencies?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Currencies = Currencies;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Currencies == null ? null : Object.hashAll(l$Currencies.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$EthOhlcv$Trading || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Currencies = Currencies;
    final lOther$Currencies = other.Currencies;
    if (l$Currencies != null && lOther$Currencies != null) {
      if (l$Currencies.length != lOther$Currencies.length) {
        return false;
      }
      for (int i = 0; i < l$Currencies.length; i++) {
        final l$Currencies$entry = l$Currencies[i];
        final lOther$Currencies$entry = lOther$Currencies[i];
        if (l$Currencies$entry != lOther$Currencies$entry) {
          return false;
        }
      }
    } else if (l$Currencies != lOther$Currencies) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$EthOhlcv$Trading on Query$EthOhlcv$Trading {
  CopyWith$Query$EthOhlcv$Trading<Query$EthOhlcv$Trading> get copyWith =>
      CopyWith$Query$EthOhlcv$Trading(this, (i) => i);
}

abstract class CopyWith$Query$EthOhlcv$Trading<TRes> {
  factory CopyWith$Query$EthOhlcv$Trading(
    Query$EthOhlcv$Trading instance,
    TRes Function(Query$EthOhlcv$Trading) then,
  ) = _CopyWithImpl$Query$EthOhlcv$Trading;

  factory CopyWith$Query$EthOhlcv$Trading.stub(TRes res) =
      _CopyWithStubImpl$Query$EthOhlcv$Trading;

  TRes call({
    List<Query$EthOhlcv$Trading$Currencies?>? Currencies,
    String? $__typename,
  });
  TRes Currencies(
    Iterable<Query$EthOhlcv$Trading$Currencies?>? Function(
      Iterable<
        CopyWith$Query$EthOhlcv$Trading$Currencies<
          Query$EthOhlcv$Trading$Currencies
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$EthOhlcv$Trading<TRes>
    implements CopyWith$Query$EthOhlcv$Trading<TRes> {
  _CopyWithImpl$Query$EthOhlcv$Trading(this._instance, this._then);

  final Query$EthOhlcv$Trading _instance;

  final TRes Function(Query$EthOhlcv$Trading) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Currencies = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$EthOhlcv$Trading(
      Currencies: Currencies == _undefined
          ? _instance.Currencies
          : (Currencies as List<Query$EthOhlcv$Trading$Currencies?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes Currencies(
    Iterable<Query$EthOhlcv$Trading$Currencies?>? Function(
      Iterable<
        CopyWith$Query$EthOhlcv$Trading$Currencies<
          Query$EthOhlcv$Trading$Currencies
        >?
      >?,
    )
    _fn,
  ) => call(
    Currencies: _fn(
      _instance.Currencies?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$EthOhlcv$Trading$Currencies(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$EthOhlcv$Trading<TRes>
    implements CopyWith$Query$EthOhlcv$Trading<TRes> {
  _CopyWithStubImpl$Query$EthOhlcv$Trading(this._res);

  TRes _res;

  call({
    List<Query$EthOhlcv$Trading$Currencies?>? Currencies,
    String? $__typename,
  }) => _res;

  Currencies(_fn) => _res;
}

class Query$EthOhlcv$Trading$Currencies {
  Query$EthOhlcv$Trading$Currencies({
    this.Block,
    this.Volume,
    this.Price,
    this.$__typename = 'Currency',
  });

  factory Query$EthOhlcv$Trading$Currencies.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$Block = json['Block'];
    final l$Volume = json['Volume'];
    final l$Price = json['Price'];
    final l$$__typename = json['__typename'];
    return Query$EthOhlcv$Trading$Currencies(
      Block: l$Block == null
          ? null
          : Query$EthOhlcv$Trading$Currencies$Block.fromJson(
              (l$Block as Map<String, dynamic>),
            ),
      Volume: l$Volume == null
          ? null
          : Query$EthOhlcv$Trading$Currencies$Volume.fromJson(
              (l$Volume as Map<String, dynamic>),
            ),
      Price: l$Price == null
          ? null
          : Query$EthOhlcv$Trading$Currencies$Price.fromJson(
              (l$Price as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$EthOhlcv$Trading$Currencies$Block? Block;

  final Query$EthOhlcv$Trading$Currencies$Volume? Volume;

  final Query$EthOhlcv$Trading$Currencies$Price? Price;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Block = Block;
    _resultData['Block'] = l$Block?.toJson();
    final l$Volume = Volume;
    _resultData['Volume'] = l$Volume?.toJson();
    final l$Price = Price;
    _resultData['Price'] = l$Price?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Block = Block;
    final l$Volume = Volume;
    final l$Price = Price;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Block, l$Volume, l$Price, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$EthOhlcv$Trading$Currencies ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Block = Block;
    final lOther$Block = other.Block;
    if (l$Block != lOther$Block) {
      return false;
    }
    final l$Volume = Volume;
    final lOther$Volume = other.Volume;
    if (l$Volume != lOther$Volume) {
      return false;
    }
    final l$Price = Price;
    final lOther$Price = other.Price;
    if (l$Price != lOther$Price) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$EthOhlcv$Trading$Currencies
    on Query$EthOhlcv$Trading$Currencies {
  CopyWith$Query$EthOhlcv$Trading$Currencies<Query$EthOhlcv$Trading$Currencies>
  get copyWith => CopyWith$Query$EthOhlcv$Trading$Currencies(this, (i) => i);
}

abstract class CopyWith$Query$EthOhlcv$Trading$Currencies<TRes> {
  factory CopyWith$Query$EthOhlcv$Trading$Currencies(
    Query$EthOhlcv$Trading$Currencies instance,
    TRes Function(Query$EthOhlcv$Trading$Currencies) then,
  ) = _CopyWithImpl$Query$EthOhlcv$Trading$Currencies;

  factory CopyWith$Query$EthOhlcv$Trading$Currencies.stub(TRes res) =
      _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies;

  TRes call({
    Query$EthOhlcv$Trading$Currencies$Block? Block,
    Query$EthOhlcv$Trading$Currencies$Volume? Volume,
    Query$EthOhlcv$Trading$Currencies$Price? Price,
    String? $__typename,
  });
  CopyWith$Query$EthOhlcv$Trading$Currencies$Block<TRes> get Block;
  CopyWith$Query$EthOhlcv$Trading$Currencies$Volume<TRes> get Volume;
  CopyWith$Query$EthOhlcv$Trading$Currencies$Price<TRes> get Price;
}

class _CopyWithImpl$Query$EthOhlcv$Trading$Currencies<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies<TRes> {
  _CopyWithImpl$Query$EthOhlcv$Trading$Currencies(this._instance, this._then);

  final Query$EthOhlcv$Trading$Currencies _instance;

  final TRes Function(Query$EthOhlcv$Trading$Currencies) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Block = _undefined,
    Object? Volume = _undefined,
    Object? Price = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$EthOhlcv$Trading$Currencies(
      Block: Block == _undefined
          ? _instance.Block
          : (Block as Query$EthOhlcv$Trading$Currencies$Block?),
      Volume: Volume == _undefined
          ? _instance.Volume
          : (Volume as Query$EthOhlcv$Trading$Currencies$Volume?),
      Price: Price == _undefined
          ? _instance.Price
          : (Price as Query$EthOhlcv$Trading$Currencies$Price?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$EthOhlcv$Trading$Currencies$Block<TRes> get Block {
    final local$Block = _instance.Block;
    return local$Block == null
        ? CopyWith$Query$EthOhlcv$Trading$Currencies$Block.stub(
            _then(_instance),
          )
        : CopyWith$Query$EthOhlcv$Trading$Currencies$Block(
            local$Block,
            (e) => call(Block: e),
          );
  }

  CopyWith$Query$EthOhlcv$Trading$Currencies$Volume<TRes> get Volume {
    final local$Volume = _instance.Volume;
    return local$Volume == null
        ? CopyWith$Query$EthOhlcv$Trading$Currencies$Volume.stub(
            _then(_instance),
          )
        : CopyWith$Query$EthOhlcv$Trading$Currencies$Volume(
            local$Volume,
            (e) => call(Volume: e),
          );
  }

  CopyWith$Query$EthOhlcv$Trading$Currencies$Price<TRes> get Price {
    final local$Price = _instance.Price;
    return local$Price == null
        ? CopyWith$Query$EthOhlcv$Trading$Currencies$Price.stub(
            _then(_instance),
          )
        : CopyWith$Query$EthOhlcv$Trading$Currencies$Price(
            local$Price,
            (e) => call(Price: e),
          );
  }
}

class _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies<TRes> {
  _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies(this._res);

  TRes _res;

  call({
    Query$EthOhlcv$Trading$Currencies$Block? Block,
    Query$EthOhlcv$Trading$Currencies$Volume? Volume,
    Query$EthOhlcv$Trading$Currencies$Price? Price,
    String? $__typename,
  }) => _res;

  CopyWith$Query$EthOhlcv$Trading$Currencies$Block<TRes> get Block =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Block.stub(_res);

  CopyWith$Query$EthOhlcv$Trading$Currencies$Volume<TRes> get Volume =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Volume.stub(_res);

  CopyWith$Query$EthOhlcv$Trading$Currencies$Price<TRes> get Price =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Price.stub(_res);
}

class Query$EthOhlcv$Trading$Currencies$Block {
  Query$EthOhlcv$Trading$Currencies$Block({
    this.Timestamp,
    this.$__typename = 'Block',
  });

  factory Query$EthOhlcv$Trading$Currencies$Block.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$Timestamp = json['Timestamp'];
    final l$$__typename = json['__typename'];
    return Query$EthOhlcv$Trading$Currencies$Block(
      Timestamp: l$Timestamp == null
          ? null
          : flexibleFloatFromJson(l$Timestamp),
      $__typename: (l$$__typename as String),
    );
  }

  final double? Timestamp;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Timestamp = Timestamp;
    _resultData['Timestamp'] = l$Timestamp;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Timestamp = Timestamp;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Timestamp, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$EthOhlcv$Trading$Currencies$Block ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Timestamp = Timestamp;
    final lOther$Timestamp = other.Timestamp;
    if (l$Timestamp != lOther$Timestamp) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$EthOhlcv$Trading$Currencies$Block
    on Query$EthOhlcv$Trading$Currencies$Block {
  CopyWith$Query$EthOhlcv$Trading$Currencies$Block<
    Query$EthOhlcv$Trading$Currencies$Block
  >
  get copyWith =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Block(this, (i) => i);
}

abstract class CopyWith$Query$EthOhlcv$Trading$Currencies$Block<TRes> {
  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Block(
    Query$EthOhlcv$Trading$Currencies$Block instance,
    TRes Function(Query$EthOhlcv$Trading$Currencies$Block) then,
  ) = _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Block;

  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Block.stub(TRes res) =
      _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Block;

  TRes call({double? Timestamp, String? $__typename});
}

class _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Block<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Block<TRes> {
  _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Block(
    this._instance,
    this._then,
  );

  final Query$EthOhlcv$Trading$Currencies$Block _instance;

  final TRes Function(Query$EthOhlcv$Trading$Currencies$Block) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Timestamp = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$EthOhlcv$Trading$Currencies$Block(
      Timestamp: Timestamp == _undefined
          ? _instance.Timestamp
          : (Timestamp as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Block<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Block<TRes> {
  _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Block(this._res);

  TRes _res;

  call({double? Timestamp, String? $__typename}) => _res;
}

class Query$EthOhlcv$Trading$Currencies$Volume {
  Query$EthOhlcv$Trading$Currencies$Volume({
    this.Usd,
    this.$__typename = 'Volume',
  });

  factory Query$EthOhlcv$Trading$Currencies$Volume.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$Usd = json['Usd'];
    final l$$__typename = json['__typename'];
    return Query$EthOhlcv$Trading$Currencies$Volume(
      Usd: l$Usd == null ? null : flexibleFloatFromJson(l$Usd),
      $__typename: (l$$__typename as String),
    );
  }

  final double? Usd;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Usd = Usd;
    _resultData['Usd'] = l$Usd;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Usd = Usd;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Usd, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$EthOhlcv$Trading$Currencies$Volume ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Usd = Usd;
    final lOther$Usd = other.Usd;
    if (l$Usd != lOther$Usd) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$EthOhlcv$Trading$Currencies$Volume
    on Query$EthOhlcv$Trading$Currencies$Volume {
  CopyWith$Query$EthOhlcv$Trading$Currencies$Volume<
    Query$EthOhlcv$Trading$Currencies$Volume
  >
  get copyWith =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Volume(this, (i) => i);
}

abstract class CopyWith$Query$EthOhlcv$Trading$Currencies$Volume<TRes> {
  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Volume(
    Query$EthOhlcv$Trading$Currencies$Volume instance,
    TRes Function(Query$EthOhlcv$Trading$Currencies$Volume) then,
  ) = _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Volume;

  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Volume.stub(TRes res) =
      _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Volume;

  TRes call({double? Usd, String? $__typename});
}

class _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Volume<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Volume<TRes> {
  _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Volume(
    this._instance,
    this._then,
  );

  final Query$EthOhlcv$Trading$Currencies$Volume _instance;

  final TRes Function(Query$EthOhlcv$Trading$Currencies$Volume) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? Usd = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$EthOhlcv$Trading$Currencies$Volume(
          Usd: Usd == _undefined ? _instance.Usd : (Usd as double?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Volume<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Volume<TRes> {
  _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Volume(this._res);

  TRes _res;

  call({double? Usd, String? $__typename}) => _res;
}

class Query$EthOhlcv$Trading$Currencies$Price {
  Query$EthOhlcv$Trading$Currencies$Price({
    this.Ohlc,
    this.$__typename = 'Price',
  });

  factory Query$EthOhlcv$Trading$Currencies$Price.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$Ohlc = json['Ohlc'];
    final l$$__typename = json['__typename'];
    return Query$EthOhlcv$Trading$Currencies$Price(
      Ohlc: l$Ohlc == null
          ? null
          : Query$EthOhlcv$Trading$Currencies$Price$Ohlc.fromJson(
              (l$Ohlc as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$EthOhlcv$Trading$Currencies$Price$Ohlc? Ohlc;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Ohlc = Ohlc;
    _resultData['Ohlc'] = l$Ohlc?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Ohlc = Ohlc;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Ohlc, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$EthOhlcv$Trading$Currencies$Price ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Ohlc = Ohlc;
    final lOther$Ohlc = other.Ohlc;
    if (l$Ohlc != lOther$Ohlc) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$EthOhlcv$Trading$Currencies$Price
    on Query$EthOhlcv$Trading$Currencies$Price {
  CopyWith$Query$EthOhlcv$Trading$Currencies$Price<
    Query$EthOhlcv$Trading$Currencies$Price
  >
  get copyWith =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Price(this, (i) => i);
}

abstract class CopyWith$Query$EthOhlcv$Trading$Currencies$Price<TRes> {
  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Price(
    Query$EthOhlcv$Trading$Currencies$Price instance,
    TRes Function(Query$EthOhlcv$Trading$Currencies$Price) then,
  ) = _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Price;

  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Price.stub(TRes res) =
      _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Price;

  TRes call({
    Query$EthOhlcv$Trading$Currencies$Price$Ohlc? Ohlc,
    String? $__typename,
  });
  CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes> get Ohlc;
}

class _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Price<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Price<TRes> {
  _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Price(
    this._instance,
    this._then,
  );

  final Query$EthOhlcv$Trading$Currencies$Price _instance;

  final TRes Function(Query$EthOhlcv$Trading$Currencies$Price) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? Ohlc = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$EthOhlcv$Trading$Currencies$Price(
          Ohlc: Ohlc == _undefined
              ? _instance.Ohlc
              : (Ohlc as Query$EthOhlcv$Trading$Currencies$Price$Ohlc?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes> get Ohlc {
    final local$Ohlc = _instance.Ohlc;
    return local$Ohlc == null
        ? CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc.stub(
            _then(_instance),
          )
        : CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc(
            local$Ohlc,
            (e) => call(Ohlc: e),
          );
  }
}

class _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Price<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Price<TRes> {
  _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Price(this._res);

  TRes _res;

  call({
    Query$EthOhlcv$Trading$Currencies$Price$Ohlc? Ohlc,
    String? $__typename,
  }) => _res;

  CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes> get Ohlc =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc.stub(_res);
}

class Query$EthOhlcv$Trading$Currencies$Price$Ohlc {
  Query$EthOhlcv$Trading$Currencies$Price$Ohlc({
    this.Open,
    this.High,
    this.Low,
    this.Close,
    this.$__typename = 'Ohlc',
  });

  factory Query$EthOhlcv$Trading$Currencies$Price$Ohlc.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$Open = json['Open'];
    final l$High = json['High'];
    final l$Low = json['Low'];
    final l$Close = json['Close'];
    final l$$__typename = json['__typename'];
    return Query$EthOhlcv$Trading$Currencies$Price$Ohlc(
      Open: l$Open == null ? null : flexibleFloatFromJson(l$Open),
      High: l$High == null ? null : flexibleFloatFromJson(l$High),
      Low: l$Low == null ? null : flexibleFloatFromJson(l$Low),
      Close: l$Close == null ? null : flexibleFloatFromJson(l$Close),
      $__typename: (l$$__typename as String),
    );
  }

  final double? Open;

  final double? High;

  final double? Low;

  final double? Close;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Open = Open;
    _resultData['Open'] = l$Open;
    final l$High = High;
    _resultData['High'] = l$High;
    final l$Low = Low;
    _resultData['Low'] = l$Low;
    final l$Close = Close;
    _resultData['Close'] = l$Close;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Open = Open;
    final l$High = High;
    final l$Low = Low;
    final l$Close = Close;
    final l$$__typename = $__typename;
    return Object.hashAll([l$Open, l$High, l$Low, l$Close, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$EthOhlcv$Trading$Currencies$Price$Ohlc ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Open = Open;
    final lOther$Open = other.Open;
    if (l$Open != lOther$Open) {
      return false;
    }
    final l$High = High;
    final lOther$High = other.High;
    if (l$High != lOther$High) {
      return false;
    }
    final l$Low = Low;
    final lOther$Low = other.Low;
    if (l$Low != lOther$Low) {
      return false;
    }
    final l$Close = Close;
    final lOther$Close = other.Close;
    if (l$Close != lOther$Close) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$EthOhlcv$Trading$Currencies$Price$Ohlc
    on Query$EthOhlcv$Trading$Currencies$Price$Ohlc {
  CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<
    Query$EthOhlcv$Trading$Currencies$Price$Ohlc
  >
  get copyWith =>
      CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc(this, (i) => i);
}

abstract class CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes> {
  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc(
    Query$EthOhlcv$Trading$Currencies$Price$Ohlc instance,
    TRes Function(Query$EthOhlcv$Trading$Currencies$Price$Ohlc) then,
  ) = _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Price$Ohlc;

  factory CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc.stub(TRes res) =
      _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Price$Ohlc;

  TRes call({
    double? Open,
    double? High,
    double? Low,
    double? Close,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes> {
  _CopyWithImpl$Query$EthOhlcv$Trading$Currencies$Price$Ohlc(
    this._instance,
    this._then,
  );

  final Query$EthOhlcv$Trading$Currencies$Price$Ohlc _instance;

  final TRes Function(Query$EthOhlcv$Trading$Currencies$Price$Ohlc) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Open = _undefined,
    Object? High = _undefined,
    Object? Low = _undefined,
    Object? Close = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$EthOhlcv$Trading$Currencies$Price$Ohlc(
      Open: Open == _undefined ? _instance.Open : (Open as double?),
      High: High == _undefined ? _instance.High : (High as double?),
      Low: Low == _undefined ? _instance.Low : (Low as double?),
      Close: Close == _undefined ? _instance.Close : (Close as double?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes>
    implements CopyWith$Query$EthOhlcv$Trading$Currencies$Price$Ohlc<TRes> {
  _CopyWithStubImpl$Query$EthOhlcv$Trading$Currencies$Price$Ohlc(this._res);

  TRes _res;

  call({
    double? Open,
    double? High,
    double? Low,
    double? Close,
    String? $__typename,
  }) => _res;
}
