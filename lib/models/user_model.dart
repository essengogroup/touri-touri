
import 'package:touritouri/models/reservation_model.dart';
import 'package:touritouri/models/trophet_model.dart';

class UserModel{
  final int id;
  final String name;
  final String? firstName;
  final String imagePath;
  final String address;
  final String email;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final List<TrophetModel>? trophets;
  final List<ReservationModel>? reservations;

  UserModel(
      {required this.id,
     required this.name,
     required this.firstName,
     required this.imagePath,
     required this.address,
     required this.email,
     required this.phone,
     required this.createdAt,
     required this.updatedAt,
      this.trophets,
      this.reservations});
}