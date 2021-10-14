import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touritouri/screens/home_page/region_site.dart';

class Region extends StatefulWidget {
  const Region({Key? key}) : super(key: key);

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/bg01.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          heightFactor: MediaQuery.of(context).size.height * .5,
          widthFactor: MediaQuery.of(context).size.width,
          child: SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    3,
                    (index) => Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 15, top: 20, bottom: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 20,
                                  color:
                                      const Color(0xFFB0CCE1).withOpacity(0.32),
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
                                      margin: const EdgeInsets.only(bottom: 15),
                                      padding: const EdgeInsets.all(25),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            'assets/datas/r$index.jpg',
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Text('region $index'),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "3 sites à visiter",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
