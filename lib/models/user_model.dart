import 'package:json_annotation/json_annotation.dart';
import 'package:touritouri/models/reservation_model.dart';
import 'package:touritouri/models/trophet_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String? firstName;
  final String? imagePath;
  final String? address;
  final String email;
  final String phone;
  final String? createdAt;
  final String? updatedAt;
  final String token;
  final List<TrophetModel>? trophets;
  final List<ReservationModel>? reservations;

  UserModel(
      {required this.id,
      required this.name,
      this.firstName,
      this.imagePath,
      this.address,
      required this.email,
      required this.phone,
      this.createdAt,
      this.updatedAt,
      required this.token,
      this.trophets,
      this.reservations});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
