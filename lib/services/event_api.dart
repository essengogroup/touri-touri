import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:touritouri/constants/base_api.dart';
import 'package:touritouri/models/event_model.dart';

class EventApi{
  static Future<List<EventModel>> getAllEvent()async{
    const String url = BaseApi.baseUrl + 'events';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      print(body);
      return body.map((tagJson) => EventModel.fromJson(tagJson)).toList();
      // return Pdf.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

}