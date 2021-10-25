import 'package:flutter/material.dart';
import 'package:touritouri/screens/home_page/region.dart';
import 'package:touritouri/screens/home_page/sites.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';
import 'package:flutter_cart/flutter_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _contentTabView = [
    const Region(),
    const Sites(),
  ];
  var cart = FlutterCart();
  @override
  Widget build(BuildContext context) =>DefaultTabController(
    length: 2,
    child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              sliverAppWidget(
                 context: context,
                  bottom: const TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(child: Text('regions')),
                      Tab(child: Text('sites')),
                    ],
                  )
              ),
            ];
          },
          body: TabBarView(
            children:_contentTabView,
          ),
        )),
  );
}
