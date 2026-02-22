/// Converts Bitquery API values (String or num) to double.
/// The API may return numbers as strings for precision.
double? flexibleFloatFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
