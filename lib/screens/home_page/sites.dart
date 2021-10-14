import 'package:flutter/material.dart';
import 'package:touritouri/widgets/build_card_site.dart';

class Sites extends StatefulWidget {
  const Sites({Key? key}) : super(key: key);

  @override
  State<Sites> createState() => _SitesState();
}

class _SitesState extends State<Sites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return builCardSite(index, context);
        },
      ),
    );
  }

}
