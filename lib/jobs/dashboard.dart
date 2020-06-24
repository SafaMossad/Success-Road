import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/jobs/showoneapplyedjob.dart';

class CompanyDashboardjobs extends StatefulWidget {
  CompanyDashboardjobs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  CompanyDashboardjobsState createState() => CompanyDashboardjobsState();
}

class CompanyDashboardjobsState extends State<CompanyDashboardjobs> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1B4F72),
            title: Text("My Jobs main"),
            centerTitle: true,
          ),
          body: new FutureBuilder<List<dynamic>>(
            future: databaseHelper.getCurrentUserJobs(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ItemList(list: snapshot.data)
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            },
          )),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new SingleChildScrollView(
           // padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 20.0),
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/94393013-team-work-in-training-room-with-planning-board.jpg",
                          fit: BoxFit.cover,
                        )),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(left: 150.0),
                       child:  Container(

                       alignment: Alignment.topRight,
                       child: Row(
                         children: <Widget>[
                           // SizedBox(width: 10.0),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               FlatButton(
                                 //elevation: 20.0,
                                 onPressed: () {
                                   // var databaseHelper=list[i]['id'];

                                   Navigator.of(context)
                                       .push(new MaterialPageRoute(
                                     builder: (BuildContext context) =>
                                     new ShowOneApplyJob(
                                         list: list, index: i),
                                   ));
                                   print("show ok now sharf");
                                 },
                                 padding: EdgeInsets.all(15.0),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(30.0),
                                 ),
                                 // color: Color(0xFF0a2f52),
                                 child: Text(
                                   'Apply Request',
                                   style: TextStyle(
                                     color: Colors.red,
                                     letterSpacing: 1.5,
                                     fontSize: 18.0,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'OpenSans',
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           Icon(
                             Icons.notifications_active,
                             color: Colors.red,
                           ),
                         ],
                       ),
                     ),),

                      Text(
                        "Title :${list[i]['title']}",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF0a2f52),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Column(
                        //runSpacing: 2.0, // gap between lines
                      //  direction: Axis.horizontal,
                        children: <Widget>[
                         Row(children: <Widget>[ Icon(
                           Icons.category,
                           color: Color(0xff2E86C1),
                         ),
                           SizedBox(
                             width: 5.0,
                           ),
                           Text(
                             "Catagory: ${list[i]['title']}",
                             style: TextStyle(
                                 fontSize: 15.0, color: Color(0xFF0a2f52)),
                           ),],),

                         Divider(),
                         Row(children: <Widget>[
                           Icon(
                             Icons.supervisor_account,
                             color: Color(0xff2E86C1),
                           ),
                           SizedBox(
                             width: 5.0,
                           ),
                           Text(
                             "Managment:${list[i]['title']}",
                             style: TextStyle(
                                 fontSize: 15.0, color: Color(0xFF0a2f52)),
                           ),
                         ],)
                        ],
                      ),
                      Divider(
                      ),
                      //Padding(padding: EdgeInsets.only(right: 50.0)),
                      Column(

                        children: <Widget>[
                         Row(children: <Widget>[ Icon(
                           Icons.location_on,
                           color: Color(0xff2E86C1),
                         ),
                           SizedBox(
                             width: 5.0,
                           ),
                           Text(
                             "Address: ${list[i]['title']}",
                             style: TextStyle(
                                 fontSize: 15.0, color: Color(0xFF0a2f52)),
                           ),],),
                        Divider(),
                         Row(children: <Widget>[
                           Icon(
                             Icons.comment,
                             color: Color(0xff2E86C1),
                           ),
                           SizedBox(
                             width: 5.0,
                           ),
                           Text(
                             "Funding: ${list[i]['title']}",
                             style: TextStyle(
                                 fontSize: 15.0, color: Color(0xFF0a2f52)),
                           ),
                         ],)
                        ],
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Description :",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "sadhashdhashhdhashdhjashdbhasjhbdjjhdbasjhbdbasjhdbhjasbhbd"
                            "asdasgsdaasbasbadsbhjasbsnbndsbnasbndbnbnasbnsdbbnasbndbnasbnbndbnadsbnadsb"
                            "savdcgasghasvbnadsbnadbnsdbnasdbnbasasbnasjkhgdgashdhgadggasgjhdghasj"
                            "asnasvashvadsvhvhdjb asnbbndbnasbnvdvansdgvashdghasvhvdvasghgvdghasghv"
                            " ${list[i]['title']}.",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: null,
                            child: Text("Edit"),
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          RaisedButton(
                            onPressed: null,
                            child: Text("delete"),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            //elevation: 20.0,
                            onPressed: () {
                              // var databaseHelper=list[i]['id'];

                              Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ShowOneApplyJob(list: list, index: i),
                              ));
                              print("show ok now sharf");
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            // color: Color(0xFF0a2f52),
                            child: Text(
                              'Apply Request',
                              style: TextStyle(
                                color: Colors.black87,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black87,
                  thickness: 1.0,
                  height: 50.0,
                )
              ],
            ),
          );
        });
  }
}
