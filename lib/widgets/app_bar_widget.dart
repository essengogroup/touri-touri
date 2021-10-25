import 'package:flutter/material.dart';
import 'package:touritouri/screens/about_page/about.dart';
import 'package:touritouri/screens/cart_page/cart_page.dart';
import 'package:touritouri/utils/constant.dart';

AppBar appBarWidget(BuildContext context){
  return AppBar(
    elevation: 0,
    title: const Text('Touri-Touri',style: TextStyle(color: Colors.white),),
    actions:  [
      Stack(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()) );
              },
              icon: const Icon(Icons.shopping_cart,color: Colors.white,size: 16,)
          ),
          Positioned(
            top: 2,
            right: 2,
            child: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: const Text('1')),
          ),
        ],
      ),
      IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const About()) );
          },
          icon: const Icon(Icons.info_outline,
          color: Colors.white,size: 16,)
      ),
    ],
  );
}

SliverAppBar sliverAppWidget({required BuildContext context,TabBar? bottom}){
 return  SliverAppBar(
   title: const Text('Touri-Touri'),
   pinned: true,
   floating: true,
   actions:  [
      Stack(
        children: [
          IconButton(
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()) );
             },
             icon: const Icon(Icons.shopping_cart,color: Colors.white,)
     ),
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
                child: const Text('1')),
          ),
        ],
      ),
     IconButton(
         onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const About()) );
         },
         icon: const Icon(Icons.info_outline,
           color: Colors.white,)
     ),
   ],
   bottom: bottom,
 );
}