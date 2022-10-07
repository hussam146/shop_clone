// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_clone/shared/components/components.dart';
import 'package:shop_clone/view_models/cart_view.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180.0,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image(
                            image:
                                NetworkImage(controller.cartModel[index].image),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: controller.cartModel[index].name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        RichText(
                          text: TextSpan(
                            text: '\$ ${controller.cartModel[index].price}',
                            style: const TextStyle(color: Colors.blue),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15.0,
                ),
                itemCount: controller.cartModel.length,
              ),
            ),
            const Text(
              'Shippping Address',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      text:
                          '13, GalalHagag, HurghadaSt., Toukh, Qaliobia, Egypt',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    maxLines: 3,
                  ),
                ),
                const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Change',
                  style: TextStyle(fontSize: 15.0, color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
