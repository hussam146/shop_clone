import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../view_models/home_view.dart';
import '../product_details_screen/product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder: (controller) => controller.load.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      searchFormField(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      buildCategoryItem(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Best Selling',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                // AccountView().signOut();
                              },
                              child: const Text(
                                'see all',
                                style: TextStyle(fontSize: 18.0),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      buildProductItem(context: context),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

Widget searchFormField() {
  return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.6),
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none),
      ));
}

Widget buildCategoryItem() {
  return GetBuilder<HomeViewModel>(
    builder: (controller) => InkWell(
      onTap: () {},
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.white,
                          child: Image.network(
                              controller.categoryModel[index].image),
                        ),
                      ),
                      Text(
                        controller.categoryModel[index].name,
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 15.0,
                ),
            itemCount: controller.categoryModel.length),
      ),
    ),
  );
}

Widget buildProductItem({context}) {
  return GetBuilder<HomeViewModel>(
    builder: (controller) => Container(
      color: Colors.white.withOpacity(.7),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1 / 1.75,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            controller.productModel.length,
            (index) => InkWell(
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                        model: controller.productModel[index]));
                  },
                  child: Container(
                    color: Colors.white,
                    width: 165.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey.withOpacity(.6),
                          child: Image(
                            height: 200.0,
                            width: double.maxFinite,
                            image: NetworkImage(
                                controller.productModel[index].image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.productModel[index].name,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              controller.productModel[index].brandName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              '\$${controller.productModel[index].price}',
                              style: TextStyle(color: HexColor('#00C569')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            growable: true),
      ),
    ),
  );
}
