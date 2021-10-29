import 'package:flutter/material.dart';
import 'package:touritouri/models/event_model.dart';

Widget buildCardEvent(
    {required BuildContext context,required int index,required EventModel eventModel}){
  return Container(
    margin: const EdgeInsets.all(8.0),
    height: MediaQuery.of(context).size.height,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.32),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        )),
  );
}