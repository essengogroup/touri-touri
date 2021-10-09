import 'package:carousel_slider/carousel_slider.dart';
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
      body: Column(
        children: [
          const SizedBox(height: 2.0),
          CarouselSlider(
            options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16/9,
                autoPlay: true,
                viewportFraction: 0.8,
                initialPage: 0,
                enlargeCenterPage: true),
            items: [1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return _builCard(context, i);
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
  Widget _builCard(BuildContext context, int index) {
    return Container(
      // height: 250,
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.32),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/datas/0$index.JPG',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
