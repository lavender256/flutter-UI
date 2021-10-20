
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/screens/details/body.dart';

import '../../cons.dart';
import '../../size_config.dart';


class DetailsScreen extends StatelessWidget {

  final Product product;
  const DetailsScreen({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondColor,
      appBar: _buildAppBar(context),
      body: Body(product: product,),
    );
  }
 Widget _buildAppBar(context){
    return AppBar(elevation: 0,
      backgroundColor: kSecondColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Colors.black,
        ),
        onPressed: ()=>Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,
          ),
        ),
        SizedBox(width: SizeConfig.defaultSize,)
      ],
    );
  }
}
