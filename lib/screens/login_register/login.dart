import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/models/user.dart';
import 'package:touritouri/screens/index.dart';
import 'package:touritouri/screens/login_register/register.dart';
import 'package:touritouri/utils/app_url.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _controllerLogin;
  late TextEditingController _controllerPassword;

  Future<Map<String, dynamic>> fetchUser(String email, String password) async {

    final response = await http.post(
      Uri.parse(AppUrl.URL_LOGIN),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': "user1@mail.com",
        'password': "123456789",
      }),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception('connexion impossible');
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerLogin = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width
          ),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors:[
                    Color(0xFF1565C0),
                    Color(0xFF1E88E5)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight)
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric( vertical: 36.0,horizontal: 24.0),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Connexion",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Bienvenue sur Touri-Touri",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Kwhite,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)
                            )
                        ),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _controllerLogin,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none
                                    ),
                                    filled: true,
                                    fillColor: Kgrey_fad,
                                    hintText: "E-mail",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey[600],
                                    )
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextField(
                                controller: _controllerPassword,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none
                                    ),
                                    filled: true,
                                    fillColor: Kgrey_fad,
                                    hintText: "Mot de passe",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey[600],
                                    )
                                ),
                              ),const SizedBox(
                                height: 50.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: (){
                                    setState(() {

                                    });
                                    String email = _controllerLogin.text;
                                    String password = (_controllerPassword.text).toString();
                                    print("email ="+email +"\nmdp = "+password);

                                    fetchUser(email,password);
                                  },
                                  color: Colors.blue[800],
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      "Se connecter",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child:
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Register()));
                                    },
                                    child: Text(
                                      "Vous n'avez pas de compte! inscrivez-vous",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Kblack,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        )
                    )
                )
              ]
          ),
        ),
      ) ,
    );
  }
}
