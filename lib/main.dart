
import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/views/auth_page.dart';
import 'package:flutter_calendar_test/views/timesheet.dart';
import 'models/client.dart';
import 'views/home.dart';
import 'package:flutter_calendar_test/views/_AddData.dart';



void main() => runApp(MyApp());
String username='';
String idUsername;
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Connexion',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timesheet Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AuthPage(),//Home pour obtenir la page avec le problème de filtre.
      routes: {
        '/client': (context){
          return Timesheet();
        },
        '/home': (context){
          return Home();
        },
        '/auth': (context){
          return AuthPage();
        },
        '/register': (context){
          return AddData();
        }


      },
    );
  }
}

