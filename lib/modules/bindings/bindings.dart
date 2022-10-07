
import 'package:shop_clone/modules/auth_service/auth_service.dart';
import 'package:shop_clone/shared/network/local_network.dart';
import 'package:shop_clone/view_models/account_view.dart';
import 'package:shop_clone/view_models/cart_view.dart';
import 'package:shop_clone/view_models/control_view.dart';
import 'package:shop_clone/view_models/home_view.dart';
import 'package:get/get.dart';

class Binding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => CacheHelper());
    Get.lazyPut(() => AccountView());
  }

}