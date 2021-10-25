import 'package:json_annotation/json_annotation.dart';
part 'site_model.g.dart';

@JsonSerializable()
class SiteModel{
  final int id;
  final String name;
  final String? imagePath;
  final String? description;


  SiteModel({required this.id, required this.name, this.imagePath, this.description});

  factory SiteModel.fromJson(Map<String, dynamic> json)=>_$SiteModelFromJson(json);

  Map<String, dynamic> toJson()=>_$SiteModelToJson(this);

  @override
  String toString() {
    return 'SiteModel{id: $id, name: $name, imagePath: $imagePath, description: $description}';
  }
}