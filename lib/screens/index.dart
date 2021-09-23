import 'package:flutter/material.dart';


class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touri-Touri'),
      ),
      body: Center(
        child: Text('Index Page'),
      ),
    );
  }
}
