import 'package:flutter/material.dart';
import 'package:touritouri/screens/cart_page/cart_page.dart';

Widget builIconShopCart(BuildContext context){
  return  Stack(
    children: [
      IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()) );
          },
          icon: const Icon(Icons.shopping_cart,color: Colors.white,size: 24,)
      ),
      Positioned(
        top: 4,
        right: 4,
        child: Container(
            height: 15,
            width: 15,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            child: const Text('1')),
      ),
    ],
  );
}