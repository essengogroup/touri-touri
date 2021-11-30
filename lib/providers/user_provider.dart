
import 'package:flutter/cupertino.dart';
import 'package:touritouri/models/user_model.dart';

class UserProvider extends ChangeNotifier{

  late UserModel _user ;

  UserModel get user => _user;

  void setUser (UserModel user){
    _user = user;
    notifyListeners();
  }
}