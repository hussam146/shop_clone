
class UserModel
{
  late String email;
  late String name;
  late String image;
  late String uId;

  UserModel({
    required this.email,
    required this.image,
    required this.name,
    required this.uId
  });

  UserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    image = json['image'];
    name = json['name'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() =>
      {
        'name' : name,
        'email' : email,
        'image' : image,
        'uId' : uId
      };
}