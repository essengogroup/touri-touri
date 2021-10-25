import 'package:flutter/material.dart';
import 'package:touritouri/models/region_model.dart';
import 'package:touritouri/models/site_model.dart';
import 'package:touritouri/widgets/build_card_site.dart';

class RegionSite extends StatefulWidget {
  final List<RegionModel> regionModels;
  final RegionModel regionModelCurrent;
  const RegionSite({Key? key,required this.regionModels,required this.regionModelCurrent}) : super(key: key);

  @override
  _RegionSiteState createState() => _RegionSiteState();
}

class _RegionSiteState extends State<RegionSite> {
  late RegionModel value = widget.regionModelCurrent;
  late List<SiteModel> currentSite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentSite = widget.regionModelCurrent.sites!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("site d'une region"),
        bottom: PreferredSize(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 16.0),
              height: 64.0,
              child: buildDropdown(),
            ),
            preferredSize: const Size.fromHeight(64.0)),
      ),
      body:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: ListView.builder(
          itemCount: currentSite.length,
          itemBuilder: (context, index) {
            return builCardSite(context: context,index: index,sites: currentSite);
          },
        ),
      ),
    );
  }

  Widget buildDropdown() => Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.blue, width: 4),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<RegionModel>(
        value: value,
        items: widget.regionModels.map((RegionModel regionModel) {
          return DropdownMenuItem<RegionModel>(
            value: regionModel,
            child: Row(
              children: [
                const Icon(Icons.place_outlined),
                const SizedBox(width: 8),
                Text(
                  regionModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (RegionModel? newValue) {
          setState(() {
            value = newValue!;
            currentSite = newValue.sites!;
          });
        },
      ),
    ),
  );
}
