import 'package:flutter/material.dart';
import 'package:touritouri/screens/about_page/about.dart';
import 'package:touritouri/utils/constant.dart';

AppBar appBarWidget(BuildContext context){
  return AppBar(
    elevation: 0,
    title: const Text('Touri-Touri',style: TextStyle(color: Colors.white),),
    actions:  [
       const IconButton(
          onPressed: null,
          icon: Icon(Icons.shopping_cart,color: Colors.white,)
      ),
      IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const About()) );
          },
          icon: const Icon(Icons.info_outline,
          color: Colors.white,)
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
     const IconButton(
         onPressed: null,
         icon: Icon(Icons.shopping_cart,color: Colors.white,)
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