import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// import 'package:cu_menopause/data/entities/user.dart';

class UserModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _username = '';
  String _password = '';

  String _mnNumber = '';
  bool _hasLogin = false;

  String get username => _username;
  String get password => _password;

  String get mnNumber => _mnNumber;
  bool get hasLogin => _hasLogin;

  void setLogin(String username, String password) {
    _username = username;
    _password = password;
    notifyListeners();
  }

  void setMnNumber(String number) {
    _mnNumber = number;
    notifyListeners();
  }

  bool getLogin() {
    if (_username == "admin" && _password == "123456789") {
      _hasLogin = true;
    } else {
      _hasLogin = false;
    }

    return _hasLogin;
  }

  bool checkMnNumber() {
    if (_mnNumber == '1312') {
      return true;
    }
    return false;
  }

  void checkForgotPassword() {}

  void reset() {
    _username = '';
    _password = '';
    _hasLogin = false;
    _mnNumber = '';
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('username', username));
    properties.add(StringProperty('password', password));

    properties.add(StringProperty('mnNumber', mnNumber));
  }
}
