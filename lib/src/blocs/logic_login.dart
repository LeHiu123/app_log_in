import 'dart:async';

import 'package:app_log_in/src/validator/validation.dart';

class logic {
  StreamController _usernameController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get username => _usernameController.stream;
  Stream get password => _passwordController.stream;
  bool isVaildInfo(String tk, String mk) {
    if (!Vadilation.isVaildUser(tk)) {
      _usernameController.sink.addError('email k hop le');
      return false;
    }
    _usernameController.sink.add('OK');
    if (!Vadilation.isVailPass(mk)) {
      _passwordController.sink.addError('pass k hop le');
      return false;
    }
    _passwordController.sink.add('OK');
    return true;
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
