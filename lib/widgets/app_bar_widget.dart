import 'package:flutter/material.dart';
import 'package:touritouri/screens/about_page/about.dart';
import 'package:touritouri/utils/constant.dart';

AppBar appBarWidget(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children:  const [
        Text('Touri-Touri',style: TextStyle(color: Colors.black),)
      ],
    ),
    actions:  [
      const IconButton(
          onPressed: null,
          icon: Icon(Icons.shopping_cart,)
      ),
      IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const About()) );
          },
          icon: Icon(Icons.info_outline,
          color: Kgrey,)
      ),
    ],
  );
}