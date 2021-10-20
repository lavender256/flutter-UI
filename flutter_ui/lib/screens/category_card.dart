import 'package:flutter/material.dart';
import 'package:flutter_ui/models/categories.dart';

import '../cons.dart';
import '../size_config.dart';
import 'body.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({@required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize*2),
      child: SizedBox(
        width: defaultSize * 20.5,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(category.title,style: TextStyle(
                            fontSize: defaultSize * 1.6, fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          height: defaultSize,
                        ),
                        Text(
                          "${category.numOfProduct}+Products",
                          style: TextStyle(color: kTextColor.withOpacity(0.6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15,
                    child: FadeInImage.assetNetwork(
                      placeholder:'assets/images/1.gif',
                      image: category.image,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}