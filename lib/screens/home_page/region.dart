import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Region extends StatefulWidget {
  const Region({Key? key}) : super(key: key);

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [

              Container(
                margin: EdgeInsets.only(bottom: 100.0,top: 30.0),
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
                                      offset: Offset(0, 4),
                                      blurRadius: 20,
                                      color: Color(0xFFB0CCE1).withOpacity(0.32),
                                    )
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: null,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          padding: const EdgeInsets.all(25),
                                          decoration: BoxDecoration(
                                              // color: Colors.blue.withOpacity(0.13),
                                              // shape: BoxShape.circle
                                          ),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.asset('assets/datas/r$index.jpg',width: 200,height: 200,fit: BoxFit.cover,)),
                                        ),
                                        Text('region $index'),
                                        SizedBox(height: 10),
                                        Text(
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
            ],
          ),
        ),
      ],
    );
  }


}
