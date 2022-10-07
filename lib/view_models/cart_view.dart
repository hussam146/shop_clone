// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, unrelated_type_equality_checks

import 'package:shop_clone/models/cart_model.dart';
import 'package:shop_clone/modules/db_helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController
{

  final ValueNotifier<bool> _load = ValueNotifier(false);
  ValueNotifier<bool> get load => _load;

  List<CartModel> _cartModel = [];
  List<CartModel> get cartModel => _cartModel;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  CartViewModel()
  {
    getProducts();
  }


  addProduct(CartModel? model) async
  {
    for(int i =0 ; i < _cartModel.length; i++)
    {
      if(_cartModel[i].id == model!.id)
      {
        return ;
      }
    }
    DataBaseHelper.db.addToCart(model);
    _cartModel.add(model!);
    _totalPrice += (double.parse(model.price)) *model.amount;
    print('added successfully');
    update();
  }

  getProducts() async
  {
    _load.value = true;
    _cartModel = await DataBaseHelper.db.getAllData();
    print(_cartModel.length);
    _load.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice()
  {
    for(int i = 0; i< _cartModel.length; i++)
      {
        _totalPrice += double.parse(_cartModel[i].price) * _cartModel[i].amount;
      }
    print(_totalPrice);
    update();
  }

  increaseAmount(int index)
  {
    _cartModel[index].amount++;
    _totalPrice += (double.parse(_cartModel[index].price));
    DataBaseHelper.db.updateData(_cartModel[index]);
    update();
  }

  decreaseAmount(int index)
  {
    if(_cartModel[index].amount < 0){
      _cartModel[index].amount;
    }
    if(_cartModel[index].amount > 0){
      _cartModel[index].amount--;
      _totalPrice -= (double.parse(_cartModel[index].price));
      DataBaseHelper.db.updateData(_cartModel[index]);
    }
    update();
  }

  deleteProduct(int index) async
  {
    // _cartModel.removeWhere((element) => element.id == _cartModel[index]);
    DataBaseHelper.db.updateData(_cartModel[index]);
    await DataBaseHelper.db.deleteData(_cartModel[index]);
    update();
  }
}