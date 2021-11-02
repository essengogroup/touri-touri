// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trophet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrophetModel _$TrophetModelFromJson(Map<String, dynamic> json) {
  return TrophetModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    imagePath: json['imagePath'] as String,
    updatedAt: json['updatedAt'] as String,
    createdAt: json['createdAt'] as String,
    users: (json['users'] as List<dynamic>)
        .map((e) => UserTrophetModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TrophetModelToJson(TrophetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'users': instance.users,
    };
