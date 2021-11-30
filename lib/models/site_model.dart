import 'package:json_annotation/json_annotation.dart';
part 'site_model.g.dart';

@JsonSerializable()
class SiteModel{
  final int id;
  final String name;
  late final int? price;
  final String? regionName;
  final String? imagePath;
  final String? description;


  SiteModel(this.id, this.name, this.price, this.regionName, this.imagePath,
      this.description);

  factory SiteModel.fromJson(Map<String, dynamic> json)=>_$SiteModelFromJson(json);

  Map<String, dynamic> toJson()=>_$SiteModelToJson(this);

  @override
  String toString() {
    return 'SiteModel{id: $id, name: $name, price: $price, regionName: $regionName, imagePath: $imagePath, description: $description}';
  }
}