import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/screens/activity_page/activity_page.dart';
import 'package:touritouri/screens/home_page/home_page.dart';
import 'package:touritouri/screens/person_page/person_page.dart';
import 'package:touritouri/screens/trophy_page/trophy_page.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final screens = [
    const HomePage(),
    const ActivityPage(),
    const TrophyPage(),
    const PersonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.search,
        size: 30,
      ),
      const Icon(
        Icons.settings,
        size: 30,
      ),
      const Icon(
        Icons.person,
        size: 30,
      ),
    ];
    return SafeArea(
      // top: false,
      child: ClipRect(
        child: Scaffold(
          extendBody: true,
          body: screens[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              key: navigationKey,
              items: items,
              index: index,
              height: 60,
              color: Colors.lightBlue,
              backgroundColor: Colors.transparent,
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
