// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:shop_clone/modules/check_out/check_out_screen.dart';
import 'package:shop_clone/view_models/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controller) => controller.cartModel.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    child: Image.asset(
                      'assets/images/empty_cart.png',
                    ),
                  ),
                ),
                const Text(
                  'Empty Cart',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            )
          : Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.horizontal,
                              onDismissed: (direction) async {
                                controller.deleteProduct(
                                    int.parse(controller.cartModel[index].id));
                                // await Future.delayed(const Duration(seconds: 1));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GetBuilder<CartViewModel>(
                                  builder: (controller) => Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        Row(
                                          children: [
                                            /// image of item
                                            Container(
                                              height: 120.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Image(
                                                image: NetworkImage(controller
                                                    .cartModel[index].image),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            ///name, price, counter of item
                                            Container(
                                              height: 120.0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    controller
                                                        .cartModel[index].name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  )),
                                                  Expanded(
                                                      child: Text(
                                                    '\$ ${controller.cartModel[index].price}',
                                                    style: TextStyle(
                                                        color: HexColor(
                                                            '#00C569')),
                                                  )),
                                                  Container(
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .increaseAmount(
                                                                      index);
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.0,
                                                                      right:
                                                                          10.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 30.0,
                                                              ),
                                                            )),
                                                        Text(
                                                          controller
                                                              .cartModel[index]
                                                              .amount
                                                              .toString(),
                                                          style:
                                                              const TextStyle(),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .decreaseAmount(
                                                                      index);
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.0,
                                                                      right:
                                                                          10.0),
                                                              child: Icon(
                                                                Icons.remove,
                                                                size: 30.0,
                                                              ),
                                                            )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10.0,
                              ),
                          itemCount: controller.cartModel.length),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controller) => Text(
                                '\$ ${controller.totalPrice}',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Get.to(() => const CheckOutScreen());
                            },
                            child: const Text(
                              'CheckOut',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
