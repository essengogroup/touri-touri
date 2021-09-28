import 'package:flutter/material.dart';

class Sites extends StatefulWidget {
  const Sites({Key? key}) : super(key: key);

  @override
  State<Sites> createState() => _SitesState();
}

class _SitesState extends State<Sites> {
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Site Touristique $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              height: 250,
              alignment: Alignment.center,
              child: Text(myProducts[index]["name"]),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
            );
          }),
    );
  }
}
