

// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_clone/models/user_model.dart';
import 'package:shop_clone/shared/network/local_network.dart';

class AccountView extends GetxController
{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAccountUser();
  }
  bool _isLoad = false;
  bool get isLoad => _isLoad;
  final CacheHelper local = Get.find();
  UserModel? userModel;
  void getAccountUser() async
  {
    _isLoad = false;
    await CacheHelper
        .getUser()
        .then((value) {
          userModel = value;
        });
    _isLoad = true;
    update();
  }

  Future<void> signOut() async
  {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    local.deleteUser();
  }
}