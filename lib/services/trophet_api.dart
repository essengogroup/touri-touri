import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:touritouri/constants/base_api.dart';
import 'package:touritouri/models/trophet_model.dart';

class TrophetApi{

  static Future<List<TrophetModel>> getAllTrophet() async{
    const String url= BaseApi.baseUrl + 'trophets';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((tagJson) => TrophetModel.fromJson(tagJson)).toList();
      // return Pdf.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

}