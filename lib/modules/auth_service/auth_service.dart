// ignore_for_file: unnecessary_overrides, prefer_if_null_operators, unnecessary_null_comparison, avoid_print

import 'package:shop_clone/models/user_model.dart';
import 'package:shop_clone/modules/control_view/control_view.dart';
import 'package:shop_clone/modules/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shop_clone/shared/network/local_network.dart';
class AuthService extends GetxController {

  late String email;
  late String password;
  late String name;

  final CacheHelper local  = Get.find();

  final Rxn<User> _user = Rxn<User>();
  final _auth = FirebaseAuth.instance;

  get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null)
      {
        getCurrentUserData(_auth.currentUser!.uid);
      }

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  signInWithGoogle() async
  {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: ['email']).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!
        .authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );

    return await FirebaseAuth
        .instance
        .signInWithCredential(credential)
        .then((value) async {
          saveUser(value);
      Get.offAll(() => const ControlViewScreen());
    });
  }

  signInWithFacebook() async
  {
    final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email']);


    final credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.token);

    await FirebaseAuth.instance.
    signInWithCredential(credential).
    then((value) async {
      saveUser(value);
    });
    Get.offAll(() => const ControlViewScreen());
  }

  signInWithEmailAndPass() async
  {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) async{
        getCurrentUserData(value.user!.uid);
      });
      Get.offAll(() => const ControlViewScreen());
    } catch (error) {
      print(error.toString());
      Get.snackbar(
          'Error while Login',
          error.toString(),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }

  createAccountWithEmailAndPass() async
  {
    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) async {
        saveUser(value);
      });
      Get.offAll(() => const ControlViewScreen());
    } catch (error) {
      Get.snackbar(
          'Error While Register',
          error.toString(),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }



  void getCurrentUserData(String? uId) async
  {
    await UserStore().getCurrentUser(uId!).then((value) {
      setUserData(UserModel.fromJson(value.data()));
    });
  }
  
  saveUser(UserCredential? credential) async
  {
    UserModel userModel = UserModel(
        name: name == null ? credential!.user!.displayName! : name,
        image: credential!.user!.photoURL! == null ? 'default': credential.user!.photoURL!,
        email: credential.user!.email!,
        uId: credential.user!.uid
    );
    await UserStore().addToCloud(userModel);
    setUserData(userModel);
  }

  setUserData(UserModel model) async
  {
    await CacheHelper.setUser(model);
  }
}

