import 'package:flutter/material.dart';
import 'package:flutter_ui/screens/body.dart';

import '../cons.dart';
import '../size_config.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(backgroundColor: Colors.white, appBar: buildAppBar(),
    body: Body(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      brightness: Brightness.light,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
          Icons.qr_code_scanner,
          color: Colors.black,
        )),
        Center(
          child: Text(
            'Scan',
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
