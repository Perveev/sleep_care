extension StringExtension on String {
  String get firstSymbol => this[0];

  String get withoutSpaces => replaceAll(RegExp(r'\s+'), '');
}

extension StringNullExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
