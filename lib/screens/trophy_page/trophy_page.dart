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
        body: ListView(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.black,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bg_head_trophy.jpg"),
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                      top: 20,
                      left: 20,
                      child: Center(
                        child: Image.asset(
                          'assets/trophy.png',
                          height: 150,
                          width: 150,
                          fit: BoxFit.contain,
                        ),
                      )),
                  const Positioned(
                    right: 20,
                    top: 50,
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        'Les recods sur touri-touri',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Wrap(
            //   crossAxisAlignment: WrapCrossAlignment.center,
            //   alignment: WrapAlignment.center,
            //   children: [
            //     SizedBox(
            //       height: 200,
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               width: 150,
            //               margin: const EdgeInsets.only(bottom: 8.0),
            //               child: Stack(
            //                 alignment: Alignment.center,
            //                 children: [
            //                   Image.asset(
            //                     'assets/trophy.png',
            //                     fit: BoxFit.cover,
            //                     height: 135,
            //                   ),
            //                   const Positioned(
            //                     bottom: 0,
            //                     child: Text(
            //                       'Name Trophy',
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                       style: TextStyle(
            //                           fontSize: 17,
            //                           color: Colors.white,
            //                           backgroundColor: Colors.black,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             Container(
            //               width: 150,
            //               height: 34,
            //               color: Colors.black12,
            //               child: true
            //                   ? Row(
            //                       crossAxisAlignment: CrossAxisAlignment.stretch,
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Container(
            //                           height: 34,
            //                           width: 34,
            //                           margin: const EdgeInsets.symmetric(
            //                               horizontal: 2.0),
            //                           decoration: const BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.all(Radius.circular(30)),
            //                               color: Colors.grey),
            //                         ),
            //                         Container(
            //                           height: 34,
            //                           width: 34,
            //                           margin: const EdgeInsets.symmetric(
            //                               horizontal: 2.0),
            //                           decoration: const BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.all(Radius.circular(30)),
            //                               color: Colors.grey),
            //                         ),
            //                         Container(
            //                           height: 34,
            //                           width: 34,
            //                           margin: const EdgeInsets.symmetric(
            //                               horizontal: 2.0),
            //                           decoration: const BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.all(Radius.circular(30)),
            //                               color: Colors.grey),
            //                         ),
            //                       ],
            //                     )
            //                   : SizedBox(
            //                       width: MediaQuery.of(context).size.width,
            //                       child: const Center(
            //                         child: Text(
            //                           'aucune participation',
            //                           maxLines: 1,
            //                           overflow: TextOverflow.ellipsis,
            //                           style: TextStyle(
            //                               color: Colors.white,
            //                               backgroundColor: Colors.black,
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                       ),
            //                     ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
                child: FutureBuilder<List<TrophetModel>>(
              future: getAlltrophet,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return const Center(child: Text('une erreur rencontrée'));
                    } else {
                      return buildWrapTrophy(snapshot.data!);
                    }
                }
              },
            )),
          ],
        ));
  }

  Widget buildWrapTrophy(List<TrophetModel> trophetModels){
    return Wrap(
      spacing: 2.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: trophetModels.map((trophetModel) => buildCardTrophy(trophetModel)).toList()
    );
  }

  Widget buildCardTrophy(TrophetModel trophetModel)=>SizedBox(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/trophy.png',
                  fit: BoxFit.cover,
                  height: 135,
                ),
                 Positioned(
                  bottom: 0,
                  child: Text(
                    trophetModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        backgroundColor: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 150,
            height: 34,
            color: Colors.black12,
            child: true
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 34,
                  width: 34,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 2.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey),
                ),
                Container(
                  height: 34,
                  width: 34,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 2.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey),
                ),
                Container(
                  height: 34,
                  width: 34,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 2.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey),
                ),
              ],
            )
                : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  'aucune participation',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );

  // Widget _gridView(List<TrophetModel> trophetModels) {
  //   return GridView.count(
  //     shrinkWrap: true,
  //     crossAxisCount: 2,
  //     mainAxisSpacing: 8,
  //     crossAxisSpacing: 8,
  //     childAspectRatio: 1.3,
  //     padding: const EdgeInsets.all(8.0),
  //     children: trophetModels
  //         .map(
  //           (trophetModel) => _itemActivityCard(context, trophetModel),
  //         )
  //         .toList(),
  //   );
  // }
  //
  // Widget _itemActivityCard(BuildContext context, TrophetModel trophet) {
  //   return Material(
  //     color: Kgrey_fad,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //     child: InkWell(
  //       onTap: () {},
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: 100.0,
  //             child: Stack(children: [
  //               Positioned.fill(
  //                 child: Image.asset(
  //                   trophet.imagePath,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ]),
  //           ),
  //           Positioned(
  //               child: FittedBox(
  //             fit: BoxFit.scaleDown,
  //             child: Text(
  //               trophet.name,
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .subtitle2!
  //                   .copyWith(color: Kblack),
  //             ),
  //           )),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
