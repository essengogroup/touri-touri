// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteModel _$SiteModelFromJson(Map<String, dynamic> json) {
  return SiteModel(
    json['id'] as int,
    json['name'] as String,
    json['price'] as int?,
    json['regionName'] as String?,
    json['imagePath'] as String?,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$SiteModelToJson(SiteModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'regionName': instance.regionName,
      'imagePath': instance.imagePath,
      'description': instance.description,
    };
