import 'package:flutter/material.dart';
import 'package:touritouri/models/site_model.dart';
import 'package:touritouri/services/site_api.dart';
import 'package:touritouri/widgets/build_card_site.dart';

class Sites extends StatefulWidget {
  const Sites({Key? key}) : super(key: key);

  @override
  State<Sites> createState() => _SitesState();
}

class _SitesState extends State<Sites> {
  late Future<List<SiteModel>> getAllSiteReverse;

  @override
  void initState() {
    super.initState();
    getAllSiteReverse = SiteApi.getAllSiteReverse();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => refreshSite(context),
      child: FutureBuilder<List<SiteModel>>(
        future: getAllSiteReverse,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('error'));
              } else {
                return buildContent(snapshot.data!);
              }
          }
        },
      ),
    );
  }

  buildContent(List<SiteModel> sites) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sites.length,
          itemBuilder: (context, index) {
            return builCardSite(context: context,index: index,sites: sites);
          },
        ),
      );

  Future<void> refreshSite(BuildContext context) async {
     setState(() {
       getAllSiteReverse = SiteApi.getAllSiteReverse();
     });
  }
}
