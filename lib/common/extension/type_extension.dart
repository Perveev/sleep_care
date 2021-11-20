extension TypeExtension<T> on T {
  R map<R>(R Function(T model) mapper) => mapper(this);
}
