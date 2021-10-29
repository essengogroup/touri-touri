// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return EventModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    imagePath: json['imagePath'] as String,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    price: json['price'] as int,
    dateBegin: json['dateBegin'] as String,
    dateEnd: json['dateEnd'] as String,
  );
}

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'tags': instance.tags,
      'price': instance.price,
      'dateBegin': instance.dateBegin,
      'dateEnd': instance.dateEnd,
    };
