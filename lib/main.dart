// import 'package:e_commerce/modules/login/login_screen.dart';
import 'package:shop_clone/shared/styles/themes.dart';
import 'package:shop_clone/view_models/cart_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shop_clone/view_models/home_view.dart';
import 'modules/bindings/bindings.dart';
import 'modules/control_view/control_view.dart';

Future<void> main() async
{
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  Get.put(HomeViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(context)
  {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const Scaffold(
          body: ControlViewScreen()
      ),
    );
  }
}
