import 'package:json_annotation/json_annotation.dart';
part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel{
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final int price;
  final String updatedAt;

  ActivityModel(
      {required this.id,
        required this.name,
        required this.description,
        required this.imagePath,
        required this.price,
        required this.updatedAt});

  factory ActivityModel.fromJson(Map<String, dynamic> json)=>_$ActivityModelFromJson(json);

  Map<String, dynamic> toJson()=>_$ActivityModelToJson(this);

  @override
  String toString() {
    return 'ActivityModel{id: $id, name: $name, description: $description, imagePath: $imagePath, price: $price, updatedAt: $updatedAt}';
  }
}