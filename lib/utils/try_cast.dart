T? TryCast<T>(dynamic x) {
  if (x == null) return null;
  try {
    return x as T;
  } on Exception catch (_) {
    return null;
  }
}
