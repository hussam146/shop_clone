import 'package:shop_clone/modules/auth_service/auth_service.dart';
import 'package:shop_clone/modules/login/login_screen.dart';
import 'package:shop_clone/view_models/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewScreen extends GetWidget<AuthService> {
  const ControlViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthService>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavBar(),
              ),
            );
    });
  }

  Widget bottomNavBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        currentIndex: controller.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.changeSelectedVal(index);
        },
        elevation: 0.0,
      ),
    );
  }
}
