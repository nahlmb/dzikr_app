import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DzikrErrorConfig {
  /// doTry() Fuction will allow [ErrorConfig] to run your function (via high order function params),
  /// and automaticly handle exception by [ErrorConfig] standart response to exception
  ///
  /// Warn :
  /// * doTry is expecting context to response error so use this function only at high lavel layer, such view or state/controller/presenter.
  ///
  /// Params :
  /// * (1) doTry takes [BuildContext] to some error that need a context to response to it;
  /// * (2) doTry takes high order function, named action, run your action/function that may invoke an error;
  static doTry(BuildContext context, Function action) async {
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
