import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/models/client.dart';
import 'package:flutter_calendar_test/views/timesheet.dart';
import 'package:http/http.dart' as http;

class ClientCard extends StatelessWidget {

  final Client client;

   ClientCard({this.client});


  void _deletUser(var id) async {
    var url = "http://10.0.2.2/timesheet_demo/delete.php";
    var response = await http.post(url, body: {"clientid": id});
    if (response.statusCode == 200) {

    } else {

    }

  }

  @override
  Widget build(BuildContext context) {


    return Card(
      elevation: 5,
      child: InkWell (
        onLongPress: () {
    print(client.id);
    //_deletUser(client.id.toString());

    //ici faire appel a la methode delete plus haut
    },
          onTap: (){
            Navigator.pushNamed(
                context,
                '/client',
              arguments: client,
            );
          },

          child:Container(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // pour être à droite
                      crossAxisAlignment: CrossAxisAlignment.start, // pour être en haut
                      children: <Widget>[
                        Icon(
                          Icons.brightness_1,
                          size: 30,
                          color: Colors.green,

                        ),
                      ],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            client.name,
                            style: TextStyle(
                              fontSize: 30,
                            )
                        ),


                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            client.tarifkm != null
                                ? "Tarifs: "+"${client.tarifhoraire}" +" EUR/heure - "+ "${client.tarifkm}"+" EUR/km"
                                : "Tarifs: "+"${client.tarifhoraire}" +" EUR/heure",
                            style: TextStyle(
                              fontSize: 15,
                            )
                        ),
                      ],
                    )
                  ],
                ),
              )

            ],
          ),
      ),
      ),
    );
  }
}
