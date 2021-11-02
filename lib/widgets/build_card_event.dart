import 'package:flutter/material.dart';
import 'package:touritouri/models/event_model.dart';

Widget buildCardEvent(
    {required BuildContext context,
    required int index,
    required EventModel eventModel}) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: 150,
    child: InkWell(
      splashColor: Colors.black26,
      onTap: () {},
      child: Ink.image(
        image: NetworkImage(eventModel.imagePath),
        height: MediaQuery.of(context).size.height,
        width: 150,
        fit: BoxFit.cover,
        child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  )),
              child: const Text(
                'details',
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
            )),
      ),
    ),
  );
  /*return Container(
    margin: const EdgeInsets.all(8.0),
    height: MediaQuery.of(context).size.height,
    width: 150,
    decoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.32),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        )),
  );*/
}
