import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_ui/models/categories.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/services/fetchCategories.dart';
import 'package:flutter_ui/services/fetchProducts.dart';

import '../cons.dart';
import '../size_config.dart';
import 'category_card.dart';
import 'details/details_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText('Browse by Categories'),
            ),
            FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Categories(
                        categories: snapshot.data,
                      )
                    : SpinKitChasingDots(
                  color: Colors.pink,
                  size: 50,
                ),
            ),
            Divider(
              height: 5,
            ),
            Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: TitleText('Recommands For You')),
            FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  return snapshot.hasData
                      ? RecommandProduct(
                          products: snapshot.data,
                        )
                      : SpinKitChasingDots(
                    color: Colors.blueAccent,
                    size: 50,
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget TitleText(title) {
    double defaultSize = SizeConfig.defaultSize;
    return Text(
      title,
      style:
          TextStyle(fontSize: defaultSize * 1.6, fontWeight: FontWeight.bold),
    );
  }
}

class RecommandProduct extends StatelessWidget {
  final List<Product> products;

  RecommandProduct({this.products});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  SizeConfig.orientation == Orientation.portrait ? 2 : 4,
              childAspectRatio: 0.693,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemBuilder: (context, index) => ProductCard(
                product: products[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              product: products[index],
                            ))),
              )),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;
    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * .75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    //  path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Categories extends StatelessWidget {
  final List<Category> categories;

  Categories({this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
                categories.length,
                (index) => CategoryCard(
                      category: categories[index],
                    ))));
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final Function press;

  ProductCard({this.product, this.press});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kSecondColor,
        ),
        child: AspectRatio(
          aspectRatio: .693,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/1.gif',
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: Text(
                  product.title,
                  style: TextStyle(
                      fontSize: defaultSize * 1.6, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: defaultSize / 2,
              ),
              Text("\$${product.price}")
            ],
          ),
        ),
      ),
    );
  }
}
