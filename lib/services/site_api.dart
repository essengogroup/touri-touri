import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:touritouri/constants/base_api.dart';
import 'package:touritouri/models/site_model.dart';

class SiteApi{
  static Future<List<SiteModel>> getAllSiteReverse()async{
    const String url = BaseApi.baseUrl + 'sites';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((tagJson) => SiteModel.fromJson(tagJson)).toList();
      // return Pdf.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}