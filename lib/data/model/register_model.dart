import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RegisterModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _mnNumber = '';

  String get mnNumer => _mnNumber;

  void setMnNumber(String number) {
    _mnNumber = number;
    notifyListeners();
  }

  bool checkMnNumber() {
    if (_mnNumber == '12345') {
      return true;
    }
    return false;
  }

  void reset() {
    _mnNumber = '';
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(StringProperty('username', username));
  }
}
