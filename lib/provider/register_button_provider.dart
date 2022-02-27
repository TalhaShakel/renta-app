import 'package:flutter/material.dart';

class RegisterButtonProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
