import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// lien vers tutoriel connexion flutter Mysql/ LOGIN:
// https://www.youtube.com/watch?v=yIB4bEFoxyU&feature=youtu.be


class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthpageState();
  }
}

class _AuthpageState extends State<AuthPage> {
  bool _acceptTerms = false;


  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  Future<List> _login() async{
    final response = await http.post("http://10.0.2.2/timesheet_demo/login.php", body:{
      "username": user.text,
      "password": pass.text,
    });
    /*
    https://medium.com/@santosenoque.ss/how-to-connect-flutter-app-to-mysql-web-server-and-phpmyadmin-e100f47bfb82
    var data = jsonDecode(response.body);
    print(data.toString());
    */
    print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(
                'https://coloredbrain.com/wp-content/uploads/2016/07/login-background.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop)),
        ),
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network(
                      'https://i0.wp.com/codecollege.co.za/wp-content/uploads/2016/12/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91.767530171531268819878.png?fit=550%2C424&ssl=1'),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Timesheet Demo',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: user,
                    textInputAction: TextInputAction.none,
                    style: new TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hasFloatingPlaceholder: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        // hintText: 'Enter your product title',
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Utilisateur'),
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: pass,
                  style: new TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // hintText: 'Enter your product description',
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Mot de passe'),
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 25, right: 5),
                    child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // SwitchListTile(
                //   title: Text('I accept the Terms & Conditions'),
                //   value: _acceptTerms,
                //   onChanged: (bool value) {
                //     setState(() {
                //       _acceptTerms = value;
                //     });
                //   },
                // ),
                SizedBox(
                  height: 25,
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.only(left: 50, right: 50),
                  // color: Theme.of(context).buttonColor,
                  textColor: Colors.white,
                  child: Text('Se connecter'),
                  onPressed: () {

                    _login();
//                    Navigator.pushNamed(context, '/home');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
