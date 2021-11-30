// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    name: json['name'] as String,
    firstName: json['firstName'] as String?,
    imagePath: json['imagePath'] as String?,
    address: json['address'] as String?,
    email: json['email'] as String,
    phone: json['phone'] as String,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    token: json['token'] as String,
    trophets: (json['trophets'] as List<dynamic>?)
        ?.map((e) => TrophetModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    reservations: (json['reservations'] as List<dynamic>?)
        ?.map((e) => ReservationModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstName': instance.firstName,
      'imagePath': instance.imagePath,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'token': instance.token,
      'trophets': instance.trophets,
      'reservations': instance.reservations,
    };
