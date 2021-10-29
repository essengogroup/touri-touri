import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/models/activity_model.dart';
import 'package:touritouri/models/event_model.dart';
import 'package:touritouri/services/activity_api.dart';
import 'package:touritouri/services/event_api.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';
import 'package:touritouri/widgets/build_card_event.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late List<ActivityModel> activities;
  late Future<List<EventModel>> getAllEvent;
  late Future<List<ActivityModel>> getAllActivity;
  late List<EventModel> itemsEvents = [
    EventModel(
        id: 1,
        name: 'event1',
        description: 'description1',
        imagePath: 'https://picsum.photos/200/300',
        tags: ["tag1", "tag2", "tag3"],
        price: 15000,
        dateBegin: "28 Oct. 2021",
        dateEnd: "28 Nov. 2021"),
    EventModel(
        id: 2,
        name: 'event2',
        description: 'description2',
        imagePath: 'https://picsum.photos/200/300',
        tags: ["tag1", "tag2", "tag3"],
        price: 15000,
        dateBegin: "28 Oct. 2021",
        dateEnd: "28 Nov. 2021"),
    EventModel(
        id: 3,
        name: 'event3',
        description: 'description2',
        imagePath: 'https://picsum.photos/200/300',
        tags: ["tag1", "tag2", "tag3"],
        price: 15000,
        dateBegin: "28 Oct. 2021",
        dateEnd: "28 Nov. 2021"),
  ];
  late List<ActivityModel> itemsActivity = [
    ActivityModel(
        id: 1,
        name: 'activity1',
        description: 'description 1',
        imagePath: "https://picsum.photos/200/300",
        price: 4000,
        updatedAt: "28 Nov. 2021"),
    ActivityModel(
        id: 2,
        name: 'activity1',
        description: 'description 1',
        imagePath: "https://picsum.photos/200/300",
        price: 4000,
        updatedAt: "28 Nov. 2021"),
  ];
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    getAllEvent = EventApi.getAllEvent();
    getAllActivity =ActivityApi.getAllActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, () {}),
      body: FutureBuilder<List>(
        future: Future.wait([getAllEvent,getAllActivity]),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator(),);
            default:
              if (snapshot.hasError)
              {
                return const Center(child: Text('error'),);
              }else{
                final data = snapshot.data!;
                List<EventModel> dataEventModels = data[0]! as List<EventModel>;
                List<ActivityModel> dataActivityModels = data[1]! as List<ActivityModel>;
                return buildContent();
              }
          }
        },
      ),
    );
  }

  buildListEvent({required String title,
    required Null Function() linkAll,
    required List<EventModel> listEvent}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  title.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                  onPressed: linkAll,
                  child: Text(
                    'Voir plus'.toLowerCase(),
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listEvent.length,
            itemBuilder: (context, index) =>
                buildCardEvent(
                    index: index,
                    context: context,
                    eventModel: listEvent[index]),
          ),
        )
      ],
    );
  }

  Widget buildImageSlider(BuildContext context, EventModel eventModel) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.32),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.network(
          eventModel.imagePath,
          fit: BoxFit.cover,
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
        ),
      ),
    );
  }

  buildListActivity({required List<ActivityModel> listActivity}) {
    return Column(
      children: listActivity
          .map((e) =>
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            width: double.infinity,
            height: 100,
            color: Colors.blueGrey,
          ))
          .toList(),
    );
  }

  Widget buildContent() =>
      ListView(
        children: [
          SizedBox(
            height: 200,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  autoPlay: true,
                  viewportFraction: 2,
                  //0.8
                  initialPage: 0,
                  enlargeCenterPage: true),
              items: itemsEvents.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return buildImageSlider(context, item);
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildListEvent(
                title: 'Evenement', linkAll: () {}, listEvent: itemsEvents),
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Divider(),
          const SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Activités'.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildListActivity(listActivity: itemsActivity),
          )
        ],
      );
}
