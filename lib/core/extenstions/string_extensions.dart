// string_extensions.dart (add to the same file)
extension StringCaseExtensions on String {
  String get capitalize => this[0].toUpperCase() + substring(1);
  String get titleCase => split(" ").map((e) => e.capitalize).join(" ");

  String get onlyDigits => replaceAll(RegExp(r"\D"), '');
}
