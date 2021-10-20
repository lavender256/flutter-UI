import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';

import '../../cons.dart';
import '../../size_config.dart';
class ProductInfo extends StatelessWidget {
  final Product product;

  ProductInfo({this.product});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5,
      width: defaultSize * (SizeConfig.orientation==Orientation.landscape?35:15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            product.category.toUpperCase(),
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          SizedBox(
            height: defaultSize,
          ),
          Text(
            product.title,
            style: TextStyle(
                fontSize: defaultSize * 2.4,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            'From',
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          Text('\$${product.price}',
              style: TextStyle(
                  fontSize: defaultSize * 1.6,
                  fontWeight: FontWeight.bold,
                  height: 1.6)),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            'Available Colors',
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          Row(children: [
            buildColorBox(color: Color(0xff7ba275),isActive: true),
            buildColorBox(color: Color(0xffd7d7d7),isActive: false),
            buildColorBox(color: kTextColor,isActive: false),
          ],)
        ],
      ),
    );
  }

  Widget buildColorBox({Color color, bool isActive = false}) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
        margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
        height: defaultSize * 2.4,
        width: defaultSize * 2.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child:isActive? Icon(
          Icons.check,
          color: Colors.white,
        ):SizedBox()
    );
  }
}