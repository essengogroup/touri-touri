// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteModel _$SiteModelFromJson(Map<String, dynamic> json) {
  return SiteModel(
    id: json['id'] as int,
    name: json['name'] as String,
    imagePath: json['imagePath'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$SiteModelToJson(SiteModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'description': instance.description,
    };
