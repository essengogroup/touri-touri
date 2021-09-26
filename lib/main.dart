import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'touri-touri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
          duration: 2500,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon( Icons.home,
                size: 50,
              ),
              Text("Touri-Touri",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                )
              ),
            ],
          ),
          nextScreen: const Index(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blue
      )
    );
  }
}


