import 'package:flutter/material.dart';

import 'package:vdev20210801/models/userModel.dart';
import 'package:vdev20210801/screens/signinScreen/services/authService.dart';

class UserProvider with ChangeNotifier {
  AuthService _authService = AuthService();
  UserModel _userModel;

  UserModel get userModel => _userModel;

  bool _isError = false;

  bool get isError => _isError;

  void removeUser() {
    _userModel = null;
  }

  void addUser(UserModel user) {
    _userModel = user;
  }

  Future<void> authUser(String email, String password) async {
    UserModel user = await _authService.authenticateUser(email, password);
    if (user != null) {
      _userModel = user;
    } else {
      _isError = true;
      notifyListeners();
    }
  }
}
