import 'dart:async';

import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/utils/debug_model.dart';
import 'app_exception.dart';

class Resource<T> {
  final Status status;
  final T? data;
  final AppException? error;

  // ignore: prefer_function_declarations_over_variables
  static AppException Function(dynamic e) _errorMapper = (e) => AppException(exception: e, title: e.toString());
  static AppException Function(dynamic e, String title, String description) _errorMapperDesc =
      (e, title, description) => AppException(exception: e, title: title, description: description);

  const Resource({
    required this.status,
    this.data,
    this.error,
  });

  static void setErrorMapper(AppException Function(dynamic e) errorMapper) {
    _errorMapper = errorMapper;
  }

  static Resource<T> loading<T>({T? data}) => Resource<T>(data: data, status: Status.loading);

  static Resource<T> failed<T>({dynamic error, T? data}) => Resource<T>(
        error: error,
        data: data,
        status: Status.failed,
      );

  static Resource<T> success<T>({T? data}) => Resource<T>(data: data, status: Status.success);

  static Future<Resource<T>> asFuture<T>(Future<dynamic> Function() req, FutureOr<T> Function(dynamic data) res) async {
    try {
      final result = await req();
      return success<T>(data: await res(result));
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      final _errorMapped = _errorMapper(e);
      DebugModel().logger.e(e.toString());
      return failed(
        error: _errorMapped,
        data: _errorMapped.data is T ? _errorMapped.data : null,
      );
    }
  }
}
