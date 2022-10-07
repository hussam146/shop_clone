
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_clone/models/user_model.dart';
import '../components/const.dart';

class CacheHelper {

  // to get user data from shared pref(local storage).
  static Future<UserModel> getUser()async
  {
    var sharedPref = await SharedPreferences.getInstance();
    var value = sharedPref.getString(cacheUserData);
    return UserModel.fromJson(json.decode(value!));
  }

  // to save user data to shared pref(local storage).
  static setUser(UserModel model) async{
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(cacheUserData, json.encode(model.toMap()));
  }

  // to delete user data from shared pref(local storage).
  void deleteUser()async
  {
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
  }
}