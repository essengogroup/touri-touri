import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touritouri/screens/about_page/about.dart';
import 'package:touritouri/screens/cart_page/cart_page.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:touritouri/widgets/build_icon_shop_cart.dart';

AppBar appBarWidget(BuildContext context, VoidCallback refresh) {
  return AppBar(
    title: const Text(
      'Touri-Touri',
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      builIconShopCart(context),
      Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: PopupMenuButton<int>(
          color: Colors.white,
          itemBuilder: (context) => [
            // PopupMenuItem<int>(value: 0, child: Row(children: [Icon(Icons.restore_page_outlined,color: Colors.black87,),SizedBox(width: 2.0),Text("Actualiser")],)),
            PopupMenuItem<int>(
                value: 0,
                child: Row(children: const [
                  Icon(
                    Icons.info_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 2.0),
                  Text("A propos")
                ])),
            const PopupMenuDivider(),
            PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.black87,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text("Déconexion")
                  ],
                )),
          ],
          onSelected: (item) => selectedItem(context, item, refresh),
        ),
      ),
    ],
  );
}
void selectedItem(BuildContext context, item, VoidCallback refresh) {
  switch (item) {
  // case 0:
  //   var refresh2 = refresh;
  //   refresh2();
  //   break;
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const About()) );
      break;
    case 1:
      print("User Logged out");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => About()), (route) => false);
      break;
  }
}

SliverAppBar sliverAppWidget({required BuildContext context, TabBar? bottom, VoidCallback? refresh}) {
  return SliverAppBar(
    title: const Text('Touri-Touri'),
    pinned: true,
    floating: true,
    actions: [
      builIconShopCart(context),
      Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: PopupMenuButton<int>(
          color: Colors.white,
          itemBuilder: (context) => [
            // PopupMenuItem<int>(value: 0, child: Row(children: [Icon(Icons.restore_page_outlined,color: Colors.black87,),SizedBox(width: 2.0),Text("Actualiser")],)),
            PopupMenuItem<int>(
                value: 0,
                child: Row(children: const [
                  Icon(
                    Icons.info_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 2.0),
                  Text("A propos")
                ])),
            const PopupMenuDivider(),
            PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.black87,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text("Déconexion")
                  ],
                )),
          ],
          onSelected: (item) => selectedItem(context, item, refresh!),
        ),
      ),
    ],
    bottom: bottom,
  );
}


