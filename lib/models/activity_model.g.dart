// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) {
  return ActivityModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    imagePath: json['imagePath'] as String,
    price: json['price'] as int,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'price': instance.price,
      'updatedAt': instance.updatedAt,
    };
