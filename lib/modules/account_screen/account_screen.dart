// ignore_for_file: avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_clone/modules/login/login_screen.dart';
import 'package:shop_clone/shared/components/components.dart';
import 'package:shop_clone/view_models/account_view.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountView>(
      init: AccountView(),
      builder: (controller) => Scaffold(
        body: ConditionalBuilder(
          condition: controller.userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.userModel != null)
                    Container(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100.0),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: controller.userModel!.image == null
                                    ? const AssetImage('assets/images/default.jpg')
                                    : controller.userModel!.image == 'default'
                                    ? const AssetImage(
                                    'assets/images/default.jpg')
                                as ImageProvider
                                    : NetworkImage(controller.userModel!.image),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userModel!.name,
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                              Text(
                                controller.userModel!.email,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  InkWell(
                    onTap: (){},
                    child: defaultListTile(
                        leading: Icons.edit,
                        text: 'Edit Profile',
                        trailing: Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: (){},
                    child: defaultListTile(
                        leading: Icons.location_on,
                        text: 'Shipping Address',
                        trailing: Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: (){},
                    child: defaultListTile(
                        leading: Icons.watch_later,
                        text: 'Order History',
                        trailing: Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: (){},
                    child: defaultListTile(
                        leading: Icons.credit_card_sharp,
                        text: 'Cards',
                        trailing: Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: (){},
                    child: defaultListTile(
                        leading: Icons.notifications,
                        text: 'Notifications',
                        trailing: Icons.arrow_forward_ios),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: (){
                      controller.signOut();
                      Get.offAll(() => LoginScreen());
                    },
                    child: defaultListTile(
                        leading: Icons.login,
                        text: 'Log Out',
                        trailing: Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
