
// ignore_for_file: prefer_typing_uninitialized_variables

class CartModel
{
  late String name;
  late String image;
  late String price;
  late String id;
  late int amount;


  CartModel({
    required this.name,
    required this.image,
    required this.price,
    required this.amount,
    required this.id
  });

  CartModel.fromJson(Map<dynamic, dynamic> json)
  {
    name = json['name'];
    price = json['price'];
    amount = json['amount'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() => {
    'name' : name,
    'image' : image,
    'amount' : amount,
    'price' : price,
    'id' : id
  };
}