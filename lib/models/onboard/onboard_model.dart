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
  OnboardModel(image: "assets/images/web.jpg", text: "text 0", description: "description 0", background: Colors.white, button: Color(0xFF4756DF)),
  OnboardModel(image: "assets/images/web.jpg", text: "text 1", description: "description 1", background: Colors.white, button: Color(0xFF4756DF)),
  OnboardModel(image: "assets/images/web.jpg", text: "text 2", description: "description 2", background: Colors.white, button: Color(0xFF4756DF)),
];