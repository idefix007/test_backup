import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/models/client.dart';
import 'package:flutter_calendar_test/views/timesheet.dart';


class ClientCard extends StatelessWidget {

  final Client client;

   ClientCard({this.client});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell (
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
