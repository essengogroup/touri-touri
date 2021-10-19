import 'package:json_annotation/json_annotation.dart';
part 'region_model.g.dart';

@JsonSerializable()
class RegionModel{
  final int id;
  final String name;
  final int nbrSite;
  final String updatedAt;

  RegionModel({required this.id,required this.name,required this.nbrSite,required this.updatedAt});

  factory RegionModel.fromJson(Map<String, dynamic> json)=>_$RegionModelFromJson(json);

  Map<String, dynamic> toJson()=>_$RegionModelToJson(this);

  @override
  String toString() {
    return 'RegionModel{id: $id, name: $name, nbrSite: $nbrSite, updatedAt: $updatedAt}';
  }
}