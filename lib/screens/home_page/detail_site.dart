import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailSite extends StatefulWidget {
  final int? index;

  const DetailSite({Key? key, required this.index}) : super(key: key);

  @override
  _DetailSiteState createState() => _DetailSiteState();
}

class _DetailSiteState extends State<DetailSite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          title: Text('nom du site'),
          centerTitle: true,
          flexibleSpace: Stack(
            children: [
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/datas/r0.jpg',
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
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
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
                Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outlined,
                  ),
                  label: Text('32'),
                ),
              ],
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            //direction: Axis.vertical,
            alignment: WrapAlignment.spaceBetween,
            verticalDirection: VerticalDirection.down,

            //textDirection: TextDirection.rtl,
            spacing: 5.0,
            children: const <Widget>[
              Chip(
                label: Text("c#"),
                padding: EdgeInsets.all(10.0),
              ),
              Chip(
                label: Text("java"),
              ),
              Chip(
                label: Text("css"),
              ),
              Chip(
                label: Text("html"),
              ),
              Chip(
                label: Text("kodsfsltiln"),
              ),
              Chip(
                label: Text("css"),
              ),
              Chip(
                label: Text("html"),
              ),
              Chip(
                label: Text("kodsfsltiln"),
              ),
              Chip(
                label: Text("css"),
              ),
              Chip(
                label: Text("html"),
              ),
              Chip(
                label: Text("kodsfsltiln"),
              ),
            ],
          ),
        ],
      ),
    );
   /* return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text("No; du site",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "Tab 1"),
                      Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: Text("Sample text"),
          ),
        ),
      ),
    );*/
  }
}
/*
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}*/
