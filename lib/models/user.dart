import 'package:flutter/material.dart';

class User{
  late int? id;
  late String name,first_name,address,email,phone,password;

  User({
    this.id,
    required this.name,
    required this.first_name,
    required this.address,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      first_name: json['first_name'],
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, first_name: $first_name, adress: $address, email: $email, phone: $phone, password: $password}';
  }
}