import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/models/region_model.dart';
import 'package:touritouri/services/region_api.dart';
import 'package:touritouri/widgets/build_card_region.dart';

class Region extends StatefulWidget {
  const Region({Key? key}) : super(key: key);

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  late Future<List<RegionModel>> getAllRegion;

  @override
  void initState() {
    super.initState();
    getAllRegion = RegionApi.getAllRegion();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RegionModel>>(
        future: getAllRegion,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('error'));
              } else {
                // return const Center(child: Text('terminer'));
                return buildCorp(snapshot.data!);
              }
          }
        });
  }

  Widget buildCorp(List<RegionModel> regions) {
    return Stack(
      children: [
        Center(
          heightFactor: MediaQuery.of(context).size.height * .5,
          widthFactor: MediaQuery.of(context).size.width,
          child: SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: regions.length,
              itemBuilder: (context, index) {
                return builCardRegion(
                    index: index, context: context, regions: regions);
              },
            ),
          ),
        ),
      ],
    );
  }
}
