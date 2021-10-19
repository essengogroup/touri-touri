// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) {
  return RegionModel(
    id: json['id'] as int,
    name: json['name'] as String,
    nbrSite: json['nbrSite'] as int,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nbrSite': instance.nbrSite,
      'updatedAt': instance.updatedAt,
    };
