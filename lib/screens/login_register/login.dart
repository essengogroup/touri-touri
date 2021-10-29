import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/constants/base_api.dart';
import 'package:touritouri/models/user.dart';
import 'package:touritouri/screens/index.dart';
import 'package:touritouri/screens/login_register/register.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:touritouri/utils/preference.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _controllerLogin;
  late TextEditingController _controllerPassword;
  late SharedPref pref;

  Future login() async {
    var response = await http.post(Uri.parse(BaseApi.URL_LOGIN), body: {
      "email": _controllerLogin.text,
      "password": _controllerPassword.text,
    });

    Map<String, dynamic> datas = json.decode(response.body);

    if(response.statusCode == 200){

      print(datas["token"]);

      var _user = datas["user"] ;
      User user = User(
        id: _user["id"],
        name: _user["name"],
        first_name: _user["first_name"],
        address: _user["address"],
        email: _user["email"],
        phone: _user["phone"]
      );

      pref.setToken(datas["token"]);
      pref.addUser(user);
      pref.setLogging(true);

      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Index(),),);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Index()), (route) => false);
    }else{

    }
  }

  @override
  void initState() {
    super.initState();
    _controllerLogin = TextEditingController();
    _controllerPassword = TextEditingController();
    pref = SharedPref();

    pref.isLogged().then((isConnected){
      if(isConnected){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Index(),),);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Index()), (route) => false);
      }
    });

    pref.getUser().then((newUser){
      print(newUser.toString());
    });
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
                                    login();
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
