import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:touritouri/models/site_model.dart';
import 'package:touritouri/widgets/build_card_util.dart';
import 'package:touritouri/widgets/build_icon_shop_cart.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class DetailSite extends StatefulWidget {
  final int? index;
  final SiteModel site;

  const DetailSite({Key? key, required this.index, required this.site})
      : super(key: key);

  @override
  _DetailSiteState createState() => _DetailSiteState();
}

class _DetailSiteState extends State<DetailSite> {
  late final List itmes = [];
  final multiSelectKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          title: Text(widget.site.name),
          centerTitle: true,
          flexibleSpace: Stack(
            children: [
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.network(
                    // "https://picsum.photos/200", //widget.site.imagePath!,
                   widget.site.imagePath!, //widget.site.imagePath!,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.blue.withOpacity(0.4),
                ),
              )
            ],
          ),
          actions: [
            builIconShopCart(context),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          raintingAction();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          child: RatingBarIndicator(
                            rating: 2.5,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 21.0,
                            direction: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outlined,
                        ),
                        label: const Text('32'),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.insert_comment_outlined,
                        ),
                        label: const Text('32'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.grey.shade600,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(widget.site.regionName!)
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  widget.site.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  'DESCRIPTION'.toUpperCase(),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  widget.site.description!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 4.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        modal(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                        onSurface: Colors.grey,
                        elevation: 5,
                      ),
                      child: const Text('reservation'),
                    ),
                    TextButton.icon(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.share_outlined,
                      ),
                      label: const Text('32'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 4.0,
              ),
              Column(
                  children: ['element1', 'element2', 'element3']
                      .map((util) => builListVertical(
                          title: util, listUtilItem: ['A', 'B', 'C']))
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget builListVertical({required title, required List listUtilItem}) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title.toUpperCase(),
              maxLines: 1,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listUtilItem.length,
                itemBuilder: (context, index) => buildCardUtil(
                  context: context,
                  index: index,
                  items: itmes,
                ),
              ),
              /*child: MultiSelectChipField(
                  items: _items,
                  key: multiSelectKey,
                  itemBuilder: (item, state) {
                    return InkWell(
                      onTap: () {
                        // _selectedAnimals.contains(item.value)
                        //     ? _selectedAnimals.remove(item.value)
                        //     : _selectedAnimals.add(item.value);
                        // state.didChange(_selectedAnimals);
                        // _multiSelectKey.currentState!.validate();
                      },
                      child: buildCardUtil(context: context),
                    );
                  },
                ),*/
            )
          ],
        ),
      );

  modal(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) =>
          SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              height: 450,
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Prix du site'),

                                    Expanded(child: Text("32000"))
                                  ],
                                ),
                              ],
                            ))),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                      child: TextButton(
                        onPressed: () {
                          modal(context);
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          onSurface: Colors.grey,
                          elevation: 5,
                        ),
                        child: const Text('valider'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  raintingAction() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Noter le site'),
        content: Container(
          padding: EdgeInsets.all(8.0),
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
