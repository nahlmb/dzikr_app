import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DzikrErrorConfig {
  /// doTry() Fuction will allow [ErrorConfig] to run your function (via high order function params),
  /// and automaticly handle exception by [ErrorConfig] standart response to exception
  static doTry(Function action) async {
    try {
      await action();
    } catch (e) {
      printOnDebug("DzikrErrorConfig : recognize global error : $e");
    }
  }
}

printOnDebug(dynamic content) {
  if (kDebugMode) {
    print(content);
  }
}
