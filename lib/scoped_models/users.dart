import '../models/user.dart';
import 'shared_data.dart';

class UsersModel extends SharedDataModel {


  void login(String email, String password) {
    authenticatedUser = User(id: '23234', email: email, password: password);
  }

}