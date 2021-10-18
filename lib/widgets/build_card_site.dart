import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touritouri/screens/home_page/detail_site.dart';

Widget builCardSite(int index, BuildContext context) {
  return Card(
    margin: EdgeInsets.only(bottom: 8.0),
    child: Column(
      children: [
        SizedBox(
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
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            duration: const Duration(seconds: 1),
                            child:  DetailSite(index: index)));
                  },
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
                        Text(
                          'Site touristique $index',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Description du site $index',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nom du site Touristique',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 2.5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text('2.5'),
                ],
              ),
              Text(
                'Description et detail du site',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_outlined,),
                      label: Text('32'),
                    ),
                  ),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: (){},
                      icon: Icon(
                        Icons.insert_comment_outlined,
                      ),
                      label: Text('32'),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
