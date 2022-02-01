import 'dart:async';
import 'package:universal_html/html.dart';

import 'constants.dart';

class LocalStorage {
  final Storage _localStorage = window.localStorage;

  LocalStorage._();

  static final LocalStorage _instance = LocalStorage._();

  factory LocalStorage() {
    return _instance;
  }

  void clean() {
    _localStorage.clear();
  }

  Future<void> logout() async {
    await cleanByKey(KSessionToken);
    await cleanByKey(KUserModel);
  }

  String? cleanByKey(String key) {
    return _localStorage.remove(key);
  }

  void save(String key, String value) {
    _localStorage[key] = value;
  }

  String? get(String key) {
    return _localStorage[key];
  }

  dynamic getFuture(String key) {
    return Future<dynamic>.delayed(
      Duration.zero,
      () => LocalStorage().get(key),
    );
  }
}
