import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/account_screen/account_screen.dart';
import '../modules/cart_screen/cart_screen.dart';
import '../modules/home_screen/home_screen.dart';

class ControlViewModel extends GetxController
{
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  Widget currentScreen = const HomeScreen();

  void changeSelectedVal(int? selectedVal)
  {
    _currentIndex = selectedVal!;
    switch(selectedVal)
    {
      case 0 : {
        currentScreen = const HomeScreen();
        break;
      }
      case 1 : {
        currentScreen = const CartScreen();
        break;
      }
      case 2 : {
        currentScreen = const AccountScreen();
        break;
      }
    }
    update();
  }
}