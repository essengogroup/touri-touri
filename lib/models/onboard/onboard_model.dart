import 'package:flutter/material.dart';

class OnboardModel{
  late String image, text, description;
  late Color background, button;

  OnboardModel({
    required this.image,
    required this.text,
    required this.description,
    required this.background,
    required this.button});
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(image: "assets/images/Onb01.png", text: "Reservation", description: " ", background: Colors.white, button: Color(0xFF4756DF)),
  OnboardModel(image: "assets/images/Onb02.png", text: "Visiter", description: " ", background: Colors.white, button: Color(0xFF4756DF)),
  OnboardModel(image: "assets/images/Onb03.png", text: "Commercer l'aventure", description: " ", background: Colors.white, button: Color(0xFF4756DF)),
];