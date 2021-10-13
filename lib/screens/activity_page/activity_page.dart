import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/models/activity_model.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late List<ActivityModel> activities;

  @override
  Widget build(BuildContext context) {
    activities = _itemActivity();

    return  Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 2.0),
            SizedBox(
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 200.0,
                    aspectRatio: 16/9,
                    autoPlay: true,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enlargeCenterPage: true),
                items: [1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return _builCard(context, i);
                    },
                  );
                }).toList(),
              ),
            ),
            Text(
              "Nos Activitées",
              style: Theme.of(context)
                  .textTheme.headline6!
                  .copyWith(color: Kblack),
            ),
            SizedBox(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                shrinkWrap: true,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return _buildActivityCard(context,index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<ActivityModel> _itemActivity(){
    return [
      ActivityModel(name: "Activité 1", image: "assets/datas/r0.jpg"),
      ActivityModel(name: "Activité 2", image: "assets/datas/r1.jpg"),
      ActivityModel(name: "Activité 3", image: "assets/datas/r2.jpg")
    ];
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

  Widget _buildActivityCard(BuildContext context, int index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Kgrey_fad,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
        child: InkWell(
          onTap: () {

          },
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
                child: Stack(
                    children:[
                      Positioned.fill(
                        child: Image.asset(
                          activities[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]
                ),
              ),
              Positioned(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      activities[index].name,
                      style: Theme.of(context)
                          .textTheme.subtitle2!
                          .copyWith(color: Kblack),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

}
