import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touritouri/models/site_model.dart';
import 'package:touritouri/screens/home_page/detail_site.dart';

Widget builCardSite({
  required int index,
  required BuildContext context,
  required List<SiteModel> sites,
   VoidCallback? addCard,

}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 8.0),
    child: Column(
      children: [
        SizedBox(
          height: 185,
          width: double.infinity,
          child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                sites[index].imagePath!,
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
                          child:  DetailSite(index: index,site: sites[index])));
                },
                splashColor: Colors.blue.withOpacity(0.4),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black45,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // const Text('2.5',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          const SizedBox(
                            width: 4.0,
                          ),
                          RatingBarIndicator(
                            rating: 2.5,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 32.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                      // const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                      sites[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
              ),
                    ),
                     IconButton(
                        onPressed: () {
                          addCard;
                        },
                        icon: const Icon(Icons.add_shopping_cart_outlined,color: Colors.redAccent,size: 24,)
                    ),
                  ],
                ),
              /*Row(
                children: [
                  RatingBarIndicator(
                    rating: 2.5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text('2.5'),
                ],
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  sites[index].description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style:
                      const TextStyle(color: Colors.black54,fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.all(Radius.circular(6.0))
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: (){},
                        icon: const Icon(Icons.favorite_outlined,),
                        label: const Text('32'),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.insert_comment_outlined,
                        ),
                        label: const Text('32'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
