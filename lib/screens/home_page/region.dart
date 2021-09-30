import 'package:flutter/material.dart';

class Region extends StatefulWidget {
  const Region({Key? key}) : super(key: key);

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: List.generate(7, (index) => Container(
              margin: EdgeInsets.only(left: 20,right: 15,top: 20,bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      color: Color(0xFFB0CCE1).withOpacity(0.32),
                    )
                  ]
              ),
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
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.13),
                              shape: BoxShape.circle
                          ),
                          child: FlutterLogo(
                            size: MediaQuery.of(context).size.width*0.18,
                          ),
                        ),
                        Text('kouilou'),
                        SizedBox(height: 10),
                        Text("3 sites à visiter",style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          height: 250,
          margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/imghome.jpeg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.32),
              borderRadius:  BorderRadius.only(
                topLeft:  Radius.circular(20.0),
                topRight:  Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )
          ),

        )
      ],
    );
  }
}
