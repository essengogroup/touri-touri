import 'package:flutter/material.dart';

class Response{
  late String message ,token;

  Response({required this.message, required this.token});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      message:json["message"],
      token:json["token"],
    );
  }
}