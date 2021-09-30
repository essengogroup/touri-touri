import 'package:flutter/material.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarWidget(context),
      body: const Center(child: Text('page Activity'),),
    );
  }
}
