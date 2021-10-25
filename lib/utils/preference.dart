import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:touritouri/models/user.dart';

class SharedPref{
  late String token;

  Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();

  SharedPref();

  addUser(User user) async {
    SharedPreferences preferences = await _prefs;
    preferences.setInt("id", user.id!);
    preferences.setString("name", user.name!);
    preferences.setString("first_name", user.first_name!);
    preferences.setString("address", user.address!);
    preferences.setString("email", user.email!);
    preferences.setString("phone", user.phone!);
  }

  setToken(String token) async {
    SharedPreferences preferences = await _prefs;
    preferences.setString("token", token);
  }

  getToken() async {
    SharedPreferences preferences = await _prefs;
    return preferences.getString("token");
  }

  Future <User> getUser() async {
    SharedPreferences preferences = await _prefs;

    User user =User(
      id: preferences.getInt("id"),
      name: preferences.getString("name"),
      first_name: preferences.getString("first_name"),
      address: preferences.getString("address"),
      email: preferences.getString("email"),
      phone: preferences.getString("phone"),
    );

    return user;
  }

  isLogged() async {
    SharedPreferences preferences = await _prefs;
    return preferences.getBool("isConnected");
  }

  setLogging(bool isConnected) async {
    SharedPreferences preferences = await _prefs;
    preferences.setBool("isConnected", isConnected);
  }

  loggout(BuildContext context,MaterialPageRoute newRoute ) async{
    SharedPreferences preferences = await _prefs;
    preferences.remove("id");
    preferences.remove("name");
    preferences.remove("first_name");
    preferences.remove("email");
    preferences.remove("phone");
    preferences.remove("address");

    setLogging(false);

    Navigator.pushReplacement(context,newRoute );
  }

}