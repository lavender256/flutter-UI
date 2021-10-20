import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';


import '../../cons.dart';
import '../../size_config.dart';

class ProductDescription extends StatelessWidget {
  final Product product;
  final Function press;

  ProductDescription({this.product, this.press});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
          top: defaultSize * 9, left: defaultSize * 2, right: defaultSize * 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(defaultSize * 1.2),
              topLeft: Radius.circular(defaultSize * 1.2))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.subTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: defaultSize * 1.8),
            ),
            SizedBox(
              height: defaultSize * 3,
            ),
            Text(
              product.description,
              style: TextStyle(color: kTextColor.withOpacity(0.7), height: 1.5),
            ),
            SizedBox(
              height: defaultSize * 3,
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: defaultSize * 2),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Add To Card666',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}