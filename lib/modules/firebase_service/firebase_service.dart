import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_clone/models/user_model.dart';


class UserStore
{
  final _collection = FirebaseFirestore.instance.collection('users');

  // to set user data to firestore
  Future addToCloud(UserModel? model) async
  {
    return await _collection.doc(model!.uId).set(model.toMap());
  }

  // to get the user himself not data.
  Future getCurrentUser(String uId) async
  {
    return await FirebaseFirestore.instance.collection('users').doc(uId).get();
  }
}