import 'package:json_annotation/json_annotation.dart';
part 'user_trophet_model.g.dart';

@JsonSerializable()
class UserTrophetModel{
  final int id;
  final String name;
  final String imagePath;
  final int point;


  UserTrophetModel({required this.id,required this.name,required this.imagePath,required this.point});

  factory UserTrophetModel.fromJson(Map<String, dynamic> json)=>_$UserTrophetModelFromJson(json);

  Map<String, dynamic> toJson()=>_$UserTrophetModelToJson(this);

  @override
  String toString() {
    return 'UserTrophetModel{id: $id, name: $name, imagePath: $imagePath, point: $point}';
  }
}