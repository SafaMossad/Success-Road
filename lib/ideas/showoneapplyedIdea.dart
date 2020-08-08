import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/dashboard.dart';
import 'package:successroad/ideas/editidea.dart';
import 'package:successroad/jobs/addjob.dart';
import 'package:successroad/jobs/dashboard.dart';

import '../ideas/showidea.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ShowOneApplyIdea extends StatefulWidget {
  List list;
  int index ;

  ShowOneApplyIdea({ this.list,this.index});

  @override

  ShowOneApplyIdeaState createState() => ShowOneApplyIdeaState();
}

final primary = Color(0xff1B4F72);
final secondary = Color(0xfff29a94);

class ShowOneApplyIdeaState extends State<ShowOneApplyIdea> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // var id=widget.id[widget.index]['Management'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title:Text( "All Requestes"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,  // add custom icons also
          ),
        ),
      ),

        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(top: 120),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: new FutureBuilder<List>(
                    future: databaseHelper.getCompanyApplyedIdeas(widget.list[widget.index]['id']),

                    builder: (context, snapshot) {
                      print("test test ${widget.list[widget.index]['id']}");
                      if (snapshot.hasError) print("snapshot.error");
                      return snapshot.hasData
                          ? new ItemList(list: snapshot.data)
                          : new Center(
                        child: new CircularProgressIndicator(),
                      );
                    },
                  ),

                ),


              ],
            ),
          ),
        )

    );
  }
}



class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});
DatabaseHelper databaseHelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            // height: 220,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                margin: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 10.0),
                //  borderOnForeground: true,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 16.0, top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "${list[i]['Responce']}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Email :${list[i]['user']['email']}",
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
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.category,
                                    color: Color(0xff2E86C1),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Name: ${list[i]['user']['employee']['name']}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.supervisor_account,
                                    color: Color(0xff2E86C1),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "job category:${list[i]['user']['employee']['jobcategory']}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),
                                  ),
                                ],
                              )
                            ],
                          ),

                          SizedBox(
                            height: 10.0,
                          ),
                          Divider(),

                          //Padding(padding: EdgeInsets.only(right: 50.0)),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xff2E86C1),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Address: ${list[i]['user']['employee']['address']}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.comment,
                                    color: Color(0xff2E86C1),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Salary: ${list[i]['user']['employee']['salary']}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),
                                  ),
                                ],
                              )
                            ],
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.comment,
                                    color: Color(0xff2E86C1),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Gender: ${list[i]['user']['employee']['Gander']}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Divider(),

                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.queue,
                                    color: Color(0xff2E86C1),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Qualification: ${list[i]['user']['employee']['Qualifcation']}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.comment,
                                    color: Color(0xff2E86C1),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Experience: ${list[i]['user']['employee']['mobile']}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Divider(),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              children: <Widget>[
                                Icon(
                                  Icons.comment,
                                  color: Color(0xff2E86C1),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "Description :${list[i]['user']['employee']['Degree']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
                                )
                              ],
                            ),
                          ),

                          Divider(
                            color: Color(0xff1B4F72),
                            thickness: 1.0,
                            endIndent: 25.0,
                            indent: 25,
                            //  height: 20.0,
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 10.0),
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton.icon(
                                    onPressed: () {
                                      // var databaseHelper=list[i]['id'];
                                      databaseHelper.acceptIdeaRequest(list[i]['id']);

                                      print("Accept Request");
                                    },
                                    icon: Icon(
                                      Icons.playlist_add,
                                      color: Color(0xff1B4F72),
                                      size: 20.0,
                                    ),
                                    label: Text("Confirm")),
                                SizedBox(
                                  width: 20.0,
                                ),
                                FlatButton.icon(
                                    onPressed: () {

                                      databaseHelper
                                          .acceptIdeaRequest(list[i]['id']);
                                      /*Navigator.of(context)
                                        .push(new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new acceptedreg(),
                                    ));*/
                                      print("Accept Request");
                                    },
                                    icon: Icon(
                                      Icons.playlist_add,
                                      color: Color(0xff1B4F72),
                                      size: 20.0,
                                    ),
                                    label: Text("Cancel"))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1.0,
                      //  height: 20.0,
                    )
                  ],
                ),
              ));
        });
  }
}

