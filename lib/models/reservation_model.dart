import 'package:json_annotation/json_annotation.dart';

part 'reservation_model.g.dart';
@JsonSerializable()
class ReservationModel {
  final int id;

  ReservationModel({required this.id});

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);
}
