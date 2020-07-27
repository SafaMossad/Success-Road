import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/jobs/dashboard.dart';
import 'package:successroad/jobs//editjob.dart';
import 'package:successroad/timeline/choocenavigationEmployee.dart';
import 'package:successroad/timeline/timelineEmployee.dart';

import '../timeline/timelineEmployee.dart';

class ShowData extends StatefulWidget {
  List list;
  int index;

  ShowData({this.index, this.list});

  @override
  ShowDataState createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  var userid;
  var jobid;

  bool _isFavorited = true;


  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Job'),
        centerTitle: true,
        backgroundColor: Color(0xff1B4F72),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                child: new FlatButton(
                  //elevation: 10.0,
                  onPressed: () {
                    databaseHelper.applyjop(widget.list[widget.index]['id']);
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EmployeeTimeline(),
                    ));
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  //color: Color(0xFF0a2f52),
                  color: Colors.transparent,
                  child: new Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(0),
                child: IconButton(
                  icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
                  color: Colors.red[500],
                  iconSize: 29.0,
                  onPressed: _toggleFavorite,
                ),
              ),
            ],
          )
        ],
      ),
      //backgroundColor: Color(0xFFe7e7e7),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/94393013-team-work-in-training-room-with-planning-board.jpg',
                    fit: BoxFit.fill,
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                decoration: BoxDecoration(
                    color: Color(0xFFe7e7e7),
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "${widget.list[widget.index]['title']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      //style: Theme.of(context).textTheme.headline4,
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize:26,
//                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "${widget.list[widget.index]['jtype']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      color: Color(0xff2E86C1),
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
                              "${widget.list[widget.index]['catagory']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.monetization_on,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${widget.list[widget.index]['salary']}",
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
                              "${widget.list[widget.index]['address']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Divider(),
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
                              "${widget.list[widget.index]['country']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        //Divider(),
//                        Row(
//                          children: <Widget>[
//                            Icon(
//                              Icons.location_city,
//                              color: Color(0xff2E86C1),
//                            ),
//                            SizedBox(
//                              width: 5.0,
//                            ),
//                            Text(
//                              "${widget.list[widget.index]['city']}",
//                              style: TextStyle(
//                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
//                            ),
//                          ],
//                        )
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
                              Icons.nature_people,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${widget.list[widget.index]['gander']}",
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
                              Icons.location_on,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${widget.list[widget.index]['qualification']}",
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
                              Icons.explicit,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${widget.list[widget.index]['experience']}",
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
                              Icons.description,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${widget.list[widget.index]['description']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
