import 'package:flutter/material.dart';
import 'package:touritouri/models/trophe_model.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class TrophyPage extends StatefulWidget {

  const TrophyPage({Key? key}) : super(key: key);

  @override
  _TrophyPageState createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {

  late List<TropheModel> trophes;

  @override
  Widget build(BuildContext context) {
    trophes = _itemTrophe();

    return  Scaffold(
        appBar: appBarWidget(context),
        body: Column(
          children: [
            Text(
              "Mes trophées",
              style: Theme.of(context)
                  .textTheme.headline6!
                  .copyWith(color: Kblack),
            ),
            SizedBox(child: _gridView()),
          ],
        )
    );
  }

  List<TropheModel> _itemTrophe() {
    return[
      TropheModel(name: "Trophé 1", image: "assets/images/r-01.jpg"),
      TropheModel(name: "Trophé 1", image: "assets/images/r-02.jpg"),
      TropheModel(name: "Trophé 1", image: "assets/images/r-03.jpg"),
      TropheModel(name: "Trophé 4", image: "assets/images/r-03.jpg")
    ];
  }

  Widget _gridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.3,
      padding: const EdgeInsets.all(8.0),
      children: trophes.map(
            (activity) => _itemActivityCard(context, activity),
      ).toList(),
    );
  }

  Widget _itemActivityCard(BuildContext context, TropheModel trophe){
    return Material(
      color: Kgrey_fad,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: InkWell(
        onTap: () {

        },
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
              child: Stack(
                  children:[
                    Positioned.fill(
                      child: Image.asset(
                        trophe.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]
              ),
            ),
            Positioned(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    trophe.name,
                    style: Theme.of(context)
                        .textTheme.subtitle2!
                        .copyWith(color: Kblack),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
