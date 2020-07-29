//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/showoneapplyedIdea.dart';
import 'package:successroad/ideas/editidea.dart';

class ShowFavoriteJobs extends StatefulWidget {
  List list;
  int index ;

  ShowFavoriteJobs({ this.list,this.index});


  @override
  ShowFavoriteJobsState createState() => ShowFavoriteJobsState();
}

class ShowFavoriteJobsState extends State<ShowFavoriteJobs> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'get Favorite Jobs',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1B4F72),
            title: Text("get Favorite Jobs "),
            centerTitle: true,
          ),
          body: new FutureBuilder<List<dynamic>>(
            future: databaseHelper.getFavoriteJobs(),
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

  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new SingleChildScrollView(
            padding: EdgeInsets.only(top: 5.0),
            child: Card(
              margin: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0),
              color: Color(0xffd8e2dc),
              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0, top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Title :${list[i]["job"]['title']}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF0a2f52),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      /*  Text(
                          "Title :${list[i]['title']}",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF0a2f52),
                            fontWeight: FontWeight.bold,
                          ),
                        ),*/
                        Divider(
                          color: Color(0xff2E86C1),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                    /*    Column(
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
                                  "Catagory: ${list[i]['catagory']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
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
                                  "jobType:${list[i]['jtype']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
                                ),
                              ],
                            )
                          ],
                        ),*/

                        SizedBox(
                          height: 10.0,
                        ),
                     /*   Divider(),*/

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
                                  "Job Type: ${list[i]['job']['jtype']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
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
                                  "Catagory: ${list[i]['job']['catagory']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
                                ),
                              ],
                            )
                          ],
                        ),

                        Divider(),
                        SizedBox(
                          height: 10.0,
                        ),

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
                                  "Salary: ${list[i]['job']['salary']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
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
                                  "Address: ${list[i]['job']['address']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
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
                                  Icons.location_on,
                                  color: Color(0xff2E86C1),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "gender: ${list[i]['job']['gander']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
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
                                  "Qualification: ${list[i]['job']['qualification']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
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
                                  "experience:  ${list[i]['job']['experience']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
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
                              Expanded(child:   Text(
                                "Description: ${list[i]['job']['description']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Color(0xFF0a2f52)),
                              ),)
                              ],
                            )
                          ],
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
            ),
          );
        }
    );
  }
}

