import 'package:flutter/material.dart';
import 'package:touritouri/models/trophet_model.dart';
import 'package:touritouri/services/trophet_api.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class TrophyPage extends StatefulWidget {

  const TrophyPage({Key? key}) : super(key: key);

  @override
  _TrophyPageState createState() => _TrophyPageState();
}

class _TrophyPageState extends State<TrophyPage> {

  late Future<List<TrophetModel>> getAlltrophet;

  @override
  void initState() {
    super.initState();
    getAlltrophet = TrophetApi.getAllTrophet();
    print(getAlltrophet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context, () {}),
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                  Positioned(
                      top:100,
                      left: 0,
                      child: Text(
                    "Mes trophées",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Kblack),
                  )
                  )

                ],
              ),
            ),
            Expanded(
                child: FutureBuilder<List<TrophetModel>>(
                  future: getAlltrophet,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return const Center(child: Text('error'));
                        } else {
                          return _gridView(snapshot.data!);
                        }
                    }
                  },
                )
            ),
          ],
        )
    );
  }

  Widget _gridView(List<TrophetModel> trophetModels) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.3,
      padding: const EdgeInsets.all(8.0),
      children: trophetModels.map(
            (trophetModel) => _itemActivityCard(context, trophetModel),
      ).toList(),
    );
  }

  Widget _itemActivityCard(BuildContext context, TrophetModel trophet) {
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
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        trophet.imagePath,
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
                    trophet.name,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Kblack),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
