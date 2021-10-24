import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:touritouri/constants/base_api.dart';
import 'package:touritouri/models/region_model.dart';

class RegionApi{

  static Future<List<RegionModel>> getAllRegion() async{
    const String url= BaseApi.baseUrl + 'region';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      print(body);
      return body.map((tagJson) => RegionModel.fromJson(tagJson)).toList();
      // return Pdf.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load pdf');
    }
  }
}