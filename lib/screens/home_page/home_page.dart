import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:touritouri/models/tabbarHome/tabBarHome.dart';
import 'package:touritouri/screens/home_page/guides.dart';
import 'package:touritouri/screens/home_page/region.dart';
import 'package:touritouri/screens/home_page/restos.dart';
import 'package:touritouri/screens/home_page/sites.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TabBarHome> _contenttab = [
    TabBarHome(icon: FontAwesomeIcons.globeAfrica, texte: 'regions'),
    TabBarHome(icon: FontAwesomeIcons.mapMarkedAlt, texte: 'sites'),
    //TabBarHome(icon: FontAwesomeIcons.utensils, texte: 'restos'),
    //TabBarHome(icon: FontAwesomeIcons.running, texte: 'guides'),
  ];
  final List<Widget> _contentTabView = [
    Region(),
    Sites(),
   // Restos(),
    //Guides(),
  ];

  Widget _builTabBar(int index) {
    return Container(
      height: 62.0,
      width: 62.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _contenttab[index].icon,
            size: 25.0,
          ),
          const SizedBox(height: 2.0),
          Text(_contenttab[index].texte,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBarWidget(context),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            Expanded(
                child: DefaultTabController(
              length: _contenttab.length,
              child: Column(
                children: [
                  TabBar(
                    unselectedLabelColor: const Color(0xFFB4C1C4),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color:Theme.of(context).primaryColorLight,
                    ),
                    tabs: _contenttab
                        .asMap()
                        .entries
                        .map((e) => _builTabBar(e.key))
                        .toList(),
                  ),
                  Expanded(child: TabBarView(
                    children: _contentTabView,
                  ))
                ],
              ),
            )),
          ],
        ),
      );
}
