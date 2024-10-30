import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isLightBLue = true;

  bool get isLightBlue => _isLightBLue;
  set isLightBlue(bool value) {
    _isLightBLue = value;
    notifyListeners();
  }

  Color get color => (_isLightBLue) ? Colors.lightBlue : Colors.amber;
}
