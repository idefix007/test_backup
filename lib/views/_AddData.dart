
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_calendar_test/main.dart';
class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNom = new TextEditingController();
  TextEditingController controllerPrenom = new TextEditingController();
  TextEditingController controllerSociete = new TextEditingController();
  TextEditingController controllerVente = new TextEditingController();
  TextEditingController controllerAchat = new TextEditingController();
  var _formKey = GlobalKey<FormState>();

  void addData() async{
    var url = "http://10.0.2.2/timesheet_demo/addData.php";
    print(controllerVente.value);
    final response = await http.post(url, body: {
      "nom": controllerNom.text,
      "prenom": controllerPrenom.text,
      "societe": controllerSociete.text,
      "fkuser":idUsername,
      "prixVente":controllerVente.text,
      "prixAchat":controllerAchat.text,

    });
  }

  String _mySelection;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Créer un client "),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNom,
                      validator: (value) {
                        if (value.isEmpty) return "Veuillez entrez un nom";
                      },
                      decoration: new InputDecoration(
                        hintText: "nom", labelText: "nom ",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person_add, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPrenom,
                      validator: (value) {
                        if (value.isEmpty) return "Veuillez entrez un prenom";
                      },
                      decoration: new InputDecoration(
                        hintText: "prenom", labelText: "prenom",
                      ),
                    ),
                  ),

                  new ListTile(
                    leading: const Icon(Icons.home, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerSociete,
                      validator: (value) {
                        if (value.isEmpty) return "Veuillez entrez un nom de societe";
                      },
                      decoration: new InputDecoration(
                        hintText: "societe", labelText: "societe",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.monetization_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerVente,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: "prixVente", labelText: "prixVente",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.monetization_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerAchat,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: "prixAchat", labelText: "prixAchat",
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[



                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(30.0),
                  ),
                  new RaisedButton(
                    child: new Text("Ajouter le client "),
                    color: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addData();
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}