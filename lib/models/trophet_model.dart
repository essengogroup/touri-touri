import 'package:json_annotation/json_annotation.dart';
import 'package:touritouri/models/user_trophet_model.dart';

part 'trophet_model.g.dart';

@JsonSerializable()
class TrophetModel {
  final int id;
  final String name;
  final String description;
  final String? imagePath;
  final String updatedAt;
  final String createdAt;
  // final List<UserTrophetModel?>? users;

  TrophetModel({
    required this.id,
    required this.name,
    required this.description,
    this.imagePath,
    required this.updatedAt,
    required this.createdAt,
    // this.users,
  });

  factory TrophetModel.fromJson(Map<String, dynamic> json) =>
      _$TrophetModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrophetModelToJson(this);

  @override
  String toString() {
    return 'TrophetModel{id: $id, name: $name, description: $description, imagePath: $imagePath, updatedAt: $updatedAt, createdAt: $createdAt}';
  }
}
