// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_trophet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTrophetModel _$UserTrophetModelFromJson(Map<String, dynamic> json) {
  return UserTrophetModel(
    id: json['id'] as int,
    name: json['name'] as String,
    imagePath: json['imagePath'] as String?,
    point: json['point'] as int,
  );
}

Map<String, dynamic> _$UserTrophetModelToJson(UserTrophetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'point': instance.point,
    };
