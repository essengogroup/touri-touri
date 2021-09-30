import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:touritouri/screens/login_register/login.dart';
import 'package:touritouri/screens/onboarding/onboarding_page.dart';

int ? isViewed;
void main() async{
  //Cette ligne permet de changer le style de la barre au dessus de l'appBar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isViewed = preferences.getInt("onBoard");
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
          nextScreen: isViewed != 0 ? Onboard() : Login(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blue
      )
    );
  }
}


