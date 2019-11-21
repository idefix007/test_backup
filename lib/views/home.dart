import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/models/client.dart';
import 'dart:async';


import 'clientCard.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List clients = [
    Client(name:'Client 1', tarifhoraire : 30.00, tarifkm : null),
    Client(name:'Client 2', tarifhoraire : 45.00, tarifkm : null),
    Client(name:'Client 3', tarifhoraire : 35.00, tarifkm : 0.35),
    Client(name:'Client 4', tarifhoraire : 30.00, tarifkm : 0.35),
    Client(name:'Client 5', tarifhoraire : 40.00, tarifkm : null),

  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
        title: Text("Bienvenue"),
          leading: Icon(Icons.home),
    ),

    body: Container(
      padding: EdgeInsets.all(10),
      child: ListView(
//        crossAxisAlignment: CrossAxisAlignment.stretch, // stretch: pour prendre toute la largeur de la page
      children: <Widget>[
...clients.map((client){
  return ClientCard(
    client: client
  );
})


      ],
    ),
    ),

//floatingActionButton: FloatingActionButton(
//  child: Icon(Icons.add),
//),
    );
  }
}

