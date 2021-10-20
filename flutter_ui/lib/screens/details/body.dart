import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/screens/details/product_description.dart';
import 'package:flutter_ui/screens/details/product_info.dart';

import '../../size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({this.product});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight ,
          child: Stack(
            children: [
              ProductInfo(product: product),
              Positioned(
                  top: defaultSize * 37.5,
                  left: 0,
                  right: 0,
                  child: ProductDescription(product: product, press: () {})),
              Positioned(
                  top: defaultSize * 9.5,
                  right: -defaultSize * 7.5,
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      height: defaultSize * 37.8,
                      width: defaultSize * 36.4,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
