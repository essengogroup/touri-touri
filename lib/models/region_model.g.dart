// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) {
  return RegionModel(
    id: json['id'] as int,
    name: json['name'] as String,
    imagePath: json['imagePath'] as String,
    nbrSite: json['nbrSite'] as int,
    updatedAt: json['updatedAt'] as String,
    sites: (json['sites'] as List<dynamic>?)
        ?.map((e) => SiteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'nbrSite': instance.nbrSite,
      'updatedAt': instance.updatedAt,
      'sites': instance.sites,
    };
