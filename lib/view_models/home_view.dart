import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class HomeViewModel extends GetxController
{

HomeViewModel()
{
  getCategory();
  getBestSelling();
}

final ValueNotifier<bool> _load = ValueNotifier(false);
ValueNotifier<bool> get load => _load;


final List<CategoryModel> _categoryModel = [];
List<CategoryModel> get categoryModel => _categoryModel;
getCategory()async
{
  _load.value = true;
  await FirebaseFirestore.instance.collection('categories').get().then((value) {
    for(var element in value.docs)
    {
      _categoryModel.add(CategoryModel.fromJson(element.data()));
      _load.value = false;
    }
  });
  update();
}

final List<ProductModel> _productModel = [];
List<ProductModel> get productModel => _productModel;
getBestSelling() async
{
  _load.value = true;
  await FirebaseFirestore.instance.collection('products').get().then((value) {
    for(var element in value.docs)
    {
      _productModel.add(ProductModel.fromJson(element.data()));
      _load.value = false;
    }
  });
  update();
}
}