import 'dart:convert';

import'package:flutter/material.dart';
import 'package:touritouri/models/user.dart';
import 'package:touritouri/screens/index.dart';
import 'package:touritouri/screens/login_register/login.dart';
import 'package:touritouri/utils/constant.dart';
import 'package:http/http.dart' as http;

Future<User> createUser(User user) async{
  final response = await http.post(
    Uri.parse('https://10.0.2.2/api/create-account'),
    headers: <String,String>{
      'Content-Type':'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      "name":user.name,
      "first_name":user.first_name,
      "adress":user.address,
      "email":user.email,
      "phone":user.phone,
      "password":user.password
    }),
  );

  if(response.statusCode == 201){
    return User.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("insertion échoué");
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerAdress = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<User> ? _futureUser;


  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }
  void validator(){
    final FormState? _formState =_formKey.currentState;
    User user = User(
      name: _controllerName.text,
      first_name: _controllerFirstName.text,
      address: _controllerAdress.text,
      email: _controllerEmail.text,
      phone: _controllerPhone.text,
      password: _controllerPassword.text,
    );

    _futureUser = createUser(user);

    /*if (_formState!.validate()){


      print(user.toString());
      //_futureUser = createUser(user);

      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Index()));

    }else{
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
                SizedBox(
                  height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric( vertical: 16.0,horizontal: 24.0),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Inscription",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w800
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Kwhite,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)
                            )
                        ),
                        child:SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value ==""){
                                      return "veuillez entrer votre nom";
                                    }
                                    return "";
                                  },
                                  controller: _controllerName,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none
                                    ),
                                    filled: true,
                                    fillColor: Kgrey_fad,
                                    hintText: "Nom",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value ==""){
                                      return "veuillez entrer votre prénom";
                                    }
                                    return "";
                                  },
                                  controller: _controllerFirstName,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none
                                    ),
                                    filled: true,
                                    fillColor: Kgrey_fad,
                                    hintText: "Prénom",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value ==""){
                                      return "veuillez entrer votre adresse";
                                    }
                                    return "";
                                  },
                                  controller: _controllerAdress,
                                  keyboardType: TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none
                                    ),
                                    filled: true,
                                    fillColor: Kgrey_fad,
                                    hintText: "Adresse",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _controllerPhone,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none
                                      ),
                                      filled: true,
                                      fillColor: Kgrey_fad,
                                      hintText: "Téléphone",
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.grey[600],
                                      )
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == ""){
                                      return "Veuillez entrer votre adresse mail";
                                    }else if(!isEmail(value!)){
                                      return "Ce mail est invalide";
                                    }
                                    return "";
                                  },
                                  controller: _controllerEmail,
                                  keyboardType: TextInputType.emailAddress,
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
                                  height: 10.0,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == ""){
                                      return "Veuillez entrerun mot de passe";
                                    }else if(value!.length <7){
                                      return "votre mot de passe doit contenir plus de huit caractère";
                                    }
                                    return "";
                                  },
                                  controller: _controllerPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none
                                    ),
                                    filled: true,
                                    fillColor: Kgrey_fad,
                                    hintText: "Mot de passe",
                                    suffixIcon: GestureDetector(
                                      onTap: (){
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: RaisedButton(
                                    onPressed: (){
                                      validator();
                                      },
                                    color: Colors.blue[800],
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 16.0),
                                      child: Text(
                                        "S'enregistrer",
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
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                                      },
                                      child: Text(
                                        "Vous avez déjà un compte! connectez-vous",
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
                          ),
                        )
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
