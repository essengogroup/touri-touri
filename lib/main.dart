import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:touritouri/screens/index.dart';
import 'package:touritouri/screens/login_register/login.dart';
import 'package:touritouri/screens/login_register/register.dart';
import 'package:touritouri/screens/onboarding_page/onboarding_page.dart';
import 'package:touritouri/theme/theme.dart';

int? isViewed;

void main() async {
  //Cette ligne permet de changer le style de la barre au dessus de l'appBar
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isViewed = preferences.getInt("onBoard");
  // MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(create: (context) => CartModel()),
  //     Provider(create: (context) => SomeOtherClass()),
  //   ],
  //   child: const MyApp(),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'touri-touri',
      theme: appTheme,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const Index(),
      // },
      home: const Index()
    );
  }
}
class AnimatedBegin extends StatefulWidget {
  const AnimatedBegin({Key? key}) : super(key: key);

  @override
  _AnimatedBeginState createState() => _AnimatedBeginState();
}

class _AnimatedBeginState extends State<AnimatedBegin> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 1000,
        splash: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/logo.jpg",
                  width: 60.0,
                  height: 60.0,
                ),
              ),
              const SizedBox(height: 4.0),
              const Text("Touri-Touri",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        // nextScreen: isViewed != 0 ? const Onboard() : const Register(),
        nextScreen: const Index(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue);
  }
}

