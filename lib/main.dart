
import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/views/timesheet.dart';
import 'models/client.dart';
import 'views/home.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Home(),
      routes: {
        '/client': (context){
          return Timesheet();
        }
      },
    );
  }
}

