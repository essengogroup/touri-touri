
import 'package:flutter/material.dart';

Widget builCardSite(int index, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    height: 185,
    width: double.infinity,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/datas/r$index.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){},
            splashColor: Colors.blue.withOpacity(0.4),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( 'Site touristique $index',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 6),
                  Text( 'Description du site $index',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}