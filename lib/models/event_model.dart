import 'package:json_annotation/json_annotation.dart';
part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final List<String> tags;
  final int price;
  final String dateBegin;
  final String dateEnd;

  EventModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.imagePath,
      required this.tags,
      required this.price,
      required this.dateBegin,
      required this.dateEnd});

  factory EventModel.fromJson(Map<String, dynamic> json)=>_$EventModelFromJson(json);

  Map<String, dynamic> toJson()=>_$EventModelToJson(this);

  @override
  String toString() {
    return 'EventModel{id: $id, name: $name, description: $description, imagePath: $imagePath, tags: $tags, price: $price, dateBegin: $dateBegin, dateEnd: $dateEnd}';
  }
}
