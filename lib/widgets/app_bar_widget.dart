import 'package:flutter/material.dart';

AppBar appBarWidget(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children:  [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/logo1.jpg',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
       const SizedBox(width: 4.0,),
        const Text('Touri-Touri',style: TextStyle(color: Colors.black),)
      ],
    ),
    actions: const [
      IconButton(
          onPressed: null,
          icon: Icon(Icons.shopping_cart,)),
    ],
  );
}