import 'package:vdev20210801/models/userModel.dart';
import 'package:vdev20210801/utils/cacheData.dart';

class AuthService {
  List credentials = [
    {'email': 'joe@black.lk', 'password': 'Jo45*78'},
    {'email': 'amal@acme.lk', 'password': 'La79*!_io'},
    {'email': 'peter@pan.lk ', 'password': 'Nap42-24'},
  ];

  Future<UserModel> authenticateUser(String email, String password) async {
    var contain = credentials.where((element) =>
        (element['email'] == email && element['password'] == password));
    if (contain.isEmpty) {
      return null;
    } else {
      UserModel userModel = UserModel(email: email, dateTime: DateTime.now());
      await CacheData().setUserInfo(userModel);
      return userModel;
    }
  }
}
