import 'package:flutter/material.dart';
import 'package:touritouri/widgets/build_card_site.dart';

class RegionSite extends StatefulWidget {
  const RegionSite({Key? key}) : super(key: key);

  @override
  _RegionSiteState createState() => _RegionSiteState();
}

class _RegionSiteState extends State<RegionSite> {
  late  String value = 'site1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Site Touristic'),
        bottom: PreferredSize(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 16.0),
              height: 64.0,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children:  const [
                      Icon(Icons.place_outlined,color: Colors.white,),
                      Text("Site actually",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ))
                    ],
                  ),
                  const SizedBox(width: 16.0,),
                  buildDropdown()
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(64.0)),
      ),
      body:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return builCardSite(index, context);
          },
        ),
      ),
    );
  }

  Widget buildDropdown() => Container(
    width: 200,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      border: Border.all(color: Colors.blue, width: 4),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        items: <String>['site1', 'site2', 'site3', 'site4'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                const Icon(Icons.place_outlined),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            value = newValue!;
          });
        },
      ),
    ),
  );
}
