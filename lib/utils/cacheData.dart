import 'package:shared_preferences/shared_preferences.dart';

import 'package:vdev20210801/models/userModel.dart';

class CacheData {
  Future<UserModel> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('userInfo');
    if (value != null) return UserModel.fromRawJson(value);
    return null;
  }

  Future<bool> setUserInfo(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('userInfo', userModel.toRawJson());
  }

  Future<bool> deleteUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('userInfo');
  }
}
