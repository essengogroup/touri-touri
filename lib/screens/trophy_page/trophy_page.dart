import 'package:flutter/material.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class TrophyPage extends StatefulWidget {
  const TrophyPage({Key? key}) : super(key: key);

  @override
  _TrophyPageState createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarWidget(context),
      body: const Center(child: Text('Page Prophet'),),
    );
  }
}
