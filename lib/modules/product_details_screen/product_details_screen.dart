// ignore_for_file: must_be_immutable

import 'package:shop_clone/view_models/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../../view_models/home_view.dart';
import '../control_view/control_view.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.model});

  final ProductModel model;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image(
                height: 250.0,
                width: double.maxFinite,
                image: NetworkImage(model.image),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.offAll(() => const ControlViewScreen());
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star_outline,
                        color: Colors.black,
                        size: 30.0,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            model.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 50.0,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: HexColor('#929292'))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: const Text('Size')),
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        model.size,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 25.0,
              ),
              Container(
                width: 150,
                height: 50.0,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: HexColor('#929292'))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: const Text('Color')),
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: HexColor('#00C569'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            'Details',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            model.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: 168.0,
              )),
          Flexible(
            fit: FlexFit.loose,
            child: Card(
              elevation: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PRICE',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\$ ${model.price}',
                          style: const TextStyle(fontSize: 25.0),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Container(
                      padding: const EdgeInsets.only(right: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 50.0,
                      width: 150,
                      child: MaterialButton(
                          color: HexColor('#00C569'),
                          onPressed: () {
                            controller.addProduct(CartModel(
                                id: model.id,
                                image: model.image,
                                name: model.name,
                                price: model.price,
                                amount: 1));
                          },
                          child: const Text(
                            'ADD',
                            style: TextStyle(fontSize: 20.0),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}