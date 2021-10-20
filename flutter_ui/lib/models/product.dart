
class Product {
  final int price;
  final String id, title, category, image, subTitle, description;

  Product({this.price,
    this.id,
    this.title,
    this.category,
    this.image,
    this.subTitle,
    this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json['title'],
        image: json['image'],
        price: json['price'],
        category: json['category'],
        subTitle: json['subTitle'],
        description: json['description']);
  }
}

Product product = Product(
  id: '1',
  price: 1600,
  title: 'Wood Frame',
  image:"https://i.imgur.com/JqKDdxj.png",
  category: 'Chair',
  subTitle: 'Tieton ArmChair',
  description: 'description descriptiondescriptiondescriptiondescription',

);
