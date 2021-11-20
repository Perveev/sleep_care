extension ListExtension<T> on List<T> {
  T? get firstOrNull => isNotEmpty ? first : null;

  Map<R, List<T>> groupBy<R>(R Function(T) key) {
    final result = <R, List<T>>{};
    for (final item in this) {
      (result[key(item)] ??= []).add(item);
    }
    return result;
  }
}

extension ListNullExtension<T> on List<T>? {
  List<T> get orEmpty => this == null ? List.empty(growable: false) : this!;

  bool get isListEmpty => this?.isEmpty ?? true;

  bool get isListNotEmpty => this?.isNotEmpty ?? false;
}
