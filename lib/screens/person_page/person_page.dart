import 'package:flutter/material.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarWidget(context),
      body: Center(child: Text('Page de profile'),),
    );
  }
}
