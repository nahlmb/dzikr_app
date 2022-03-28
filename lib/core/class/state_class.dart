import 'package:flutter/material.dart';

class StateClass extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  toogleLoading() {
    _isLoading = !_isLoading;
  }
}
