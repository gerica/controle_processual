class AppException<E> implements Exception {
  final String? title;
  final String? description;
  final E? exception;
  final dynamic data;

  AppException({
    this.title,
    this.exception,
    this.data,
    this.description,
  });

  factory AppException.generic() => AppException(title: 'Error', description: 'Please try again later.');

  @override
  String toString() => title ?? '';
}
