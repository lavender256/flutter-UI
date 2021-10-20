class Category {
  final String id, title, image;
  final int numOfProduct;

  Category({this.id, this.title, this.image, this.numOfProduct});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        image: json['image'],
        id: json['id'],
        title: json['title'],
        numOfProduct: json['numOfProducts']);
  }
}

Category category=Category(
  id: '1',
  title: 'ArmChair',
  image: 'assets/images/1.jpg',
    numOfProduct: 100,
);