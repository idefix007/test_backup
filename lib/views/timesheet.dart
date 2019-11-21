import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/models/client.dart';



class Timesheet extends StatefulWidget {




  _TimesheetState createState() => _TimesheetState();
}

class _TimesheetState extends State<Timesheet> {


  static const int firstYear = 2019;
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;


  @override
  Widget build(BuildContext context) {

    final Client client = ModalRoute.of(context).settings.arguments;

    int number = daysInMonth(month, year); // le nombre de jour du mois et de l'année sélectionnés

    return Scaffold(
      appBar: AppBar(
        title: Text("Timesheet"),
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 5),
            child:Theme(
              data: ThemeData(
                canvasColor: Theme.of(context).primaryColor,
              ),
              child: DropdownButton<int>(
                iconEnabledColor: Colors.white,
                value: month,
                items: List<int>.generate(DateTime.now().month, (i) => 1+i).map((month) =>
                    DropdownMenuItem<int>(
                      value: month,
                      child: Text(
                        _monthToString(month),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                ).toList(),
                onChanged: (selected) => setState(() =>month = selected),
              ),
            ),
          ),

          Padding(
            padding:EdgeInsets.only(left: 5, right: 10),
            child:Theme(
              data: ThemeData(
                canvasColor: Theme.of(context).primaryColor,
              ),
              child: DropdownButton<int>(
                iconEnabledColor: Colors.white,
                value: year,
                items: List<int>.generate(DateTime.now().year-firstYear+1, (i) => firstYear+i).map((year) =>
                    DropdownMenuItem<int>(
                      value: year,
                      child: Text(
                        "$year",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                ).toList(),
                onChanged: (selected) => setState(() =>year = selected),
              ),
            ),
          ),

        ],


      ),

      body: Column(
        children: <Widget>[

      Container(
      margin:EdgeInsets.all(15.0),

          child: Column(

                children: <Widget>[               Text(
                  "${client.name}",
                  style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                ),
        ],
              ),
      ),

          Expanded(
              child: ListView(
                children: List<int>.generate(number, (i) => 1+i).map((number){
                  return new Card(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "$number"+" "+_monthToString(month),
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              )),

                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:     TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(15.0),
                                    hintText: 'Heures',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              )),

                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:     TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(15.0),
                                    hintText: 'km',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              )),
                        ],
                      ));
                }).toList(),
                itemExtent: 60.0,
              )
          ),

          Container(
            margin:EdgeInsets.all(10.0),
            color: Colors.grey,
            child: Row(
              children: <Widget>[

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:                Text(
                        'TOTAL',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                      ),
                    )),

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:                Text(
                        '25 heures',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:                Text(
                        '96 km',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),

              ],
            ),
          ),


          Container(
            margin:EdgeInsets.fromLTRB(5.0,5.0,10.0,10.0),

            child: Row(
              children: <Widget>[

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:                Text(
                        '1500,00 EUR',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.deepOrange, decoration: TextDecoration.underline, decorationStyle: TextDecorationStyle.double),
                      ),
                    )),

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:                Text(
                        '1300,00 EUR',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    )),

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:                Text(
                        '200,00 EUR',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    )),

              ],
            ),
          ),

          Container(
            margin:EdgeInsets.fromLTRB(5.0,5.0,10.0,10.0),
            child: Row(

              children: <Widget>[

                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () => {},
                        child: Text ("Télécharge ta facture"),
                        color: Colors.indigo,
                        textColor: Colors.white,
                      ),
                    )),

/*                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () => {},
                        child: Text ("Sauver"),
                        color: Colors.indigo,
                        textColor: Colors.white,
                      ),
                    )),*/

                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:RaisedButton(
                            onPressed: () => {},
                            child: Text ("Envoyer", style: TextStyle(color: Colors.white)),
                            color: Colors.indigo
                        )

                    )),
              ],
            ),
          ),
        ],
      ),

    );
  }
}



//    );
//  }
//  }




_monthToString(int month) {

  switch (month){

    case 1:
      return "Janvier";

    case 2:
      return "Février";

    case 3:
      return "Mars";

    case 4:
      return "Avril";

    case 5:
      return "Mai";

    case 6:
      return "Juin";

    case 7:
      return "Juillet";

    case 8:
      return "Août";

    case 9:
      return "Septembre";

    case 10:
      return "Octobre";

    case 11:
      return "Novembre";

    case 12:
      return "Décembre";

    default:
      return "";

  }
}

daysInMonth(int monthNum, int year)
{

  List<int> monthLength = new List(12);

  monthLength[0] = 31;
  monthLength[2] = 31;
  monthLength[4] = 31;
  monthLength[6] = 31;
  monthLength[7] = 31;
  monthLength[9] = 31;
  monthLength[11] = 31;
  monthLength[3] = 30;
  monthLength[8] = 30;
  monthLength[5] = 30;
  monthLength[10] = 30;

  if (leapYear(year) == true)
    monthLength[1] = 29;
  else
    monthLength[1] = 28;

  return monthLength[monthNum -1];
}

leapYear(int year)
{
  bool leapYear = false;

  bool leap =  ((year % 100 == 0) && (year % 400 != 0));
  if (leap == true)
    leapYear = false;
  else if (year % 4 == 0)
    leapYear = true;


  return leapYear;
}
