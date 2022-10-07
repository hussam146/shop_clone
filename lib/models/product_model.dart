
class ProductModel
{
  late String name, image, color, description, size, price, brandName;
  late String id;

  ProductModel({
    required this.name,
    required this.image,
    required this.size,
    required this.price,
    required this.color,
    required this.description,
    required this.brandName,
    required this.id,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    image = json['image'];
    size = json['size'];
    color = json['color'];
    price = json['price'];
    description = json['description'];
    brandName = json['brandName'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() => {
    'name' : name,
    'image' : image,
    'size' : size,
    'color' : color,
    'price' : price,
    'description' : description,
    'brandName' : brandName,
    'id' : id
  };
}