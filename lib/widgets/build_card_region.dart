
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touritouri/models/region_model.dart';
import 'package:touritouri/screens/home_page/region_site.dart';

Widget builCardRegion(BuildContext context,List<RegionModel> regions, int index){
  return Container(
    margin: const EdgeInsets.only(
        left: 20, right: 15, top: 20, bottom: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: const Color(0xFFB0CCE1)
                .withOpacity(0.32),
          )
        ]),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.scale,
                  alignment: Alignment.bottomCenter,
                  duration: const Duration(seconds: 1),
                  child: const RegionSite()));
        },
        splashColor: Colors.blue.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin:
                const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(25),
                child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(100),
                    child: const FlutterLogo(size: 200.0,)
                  /*Image.asset(
                      'assets/datas/r$index.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )*/
                ),
              ),
              Text(regions[index].name),
              const SizedBox(height: 10),
               Text(
                "${regions[index].nbrSite} sites à visiter",
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    ),
  );
}