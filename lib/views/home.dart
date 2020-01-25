import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/models/client.dart';
import 'dart:async';
import 'clientCard.dart';
import 'package:flutter_calendar_test/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List clients=new List() ;

class _HomeState extends State<Home> {

  Future<List> getData() async {
    final url = "http://10.0.2.2/timesheet_demo/showClient.php";
    print("avant le response");
    final response = await http.post(url, body: {
      "id": idUsername,
    });
    if (response.statusCode == 200) {
      final client_users = json.decode(response.body);
      print(client_users[0]['nom']);

      // on peut utilisez le fetchAll assoc du coup le client_users[i]['nom'] est correct

      setState(() {
        clients.clear();
        for(int i=0;i<client_users.length;i++) {


         var prixVente=double.parse(client_users[i]['prixVente']);
         assert(prixVente is double);
         var prixAchat=double.parse(client_users[i]['prixAchat']);
         assert(prixAchat is double);
         var id=int.parse(client_users[i]['id']);

         var cli = Client(id: id,name: client_users[i]['nom'], tarifhoraire:prixVente, tarifkm: prixAchat);
              clients.add(cli);
      }
      });
    }
  }

// fin methode getData -------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Bienvenue" + " " + username),
        leading: Icon(Icons.home),
      ),

      body: Container(

        padding: EdgeInsets.all(10),
        child: ListView(

//        crossAxisAlignment: CrossAxisAlignment.stretch, // stretch: pour prendre toute la largeur de la page
          children: <Widget>[
            RaisedButton(
              child: Text("Se déconnecter"),

              onPressed: () {
                Navigator.pushReplacementNamed(context, '/auth');
              },

            ),
            RaisedButton(
              child: Text("Créer un client"),

              onPressed: () {
                Navigator.pushReplacementNamed(context, '/register');
              },

            ),


            ...clients.map((client) {

              return ClientCard(client: client);
            })

          ],


        ),




      ),

//floatingActionButton: FloatingActionButton(
//  child: Icon(Icons.add),
//),

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
}
