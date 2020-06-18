import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/jobs/dashboard.dart';
import 'package:successroad/jobs//editjob.dart';
import 'package:successroad/timeline/choocenavigationEmployee.dart';
import 'package:successroad/timeline/timelinejob.dart';

import '../timeline/timelinejob.dart';




class ShowData extends StatefulWidget{

  List list;
  int index;
  ShowData({this.index , this.list}) ;


  @override
  ShowDataState  createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  var userid;
  var jobid;
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
                    databaseHelper
                        .applyjop(widget.list[widget.index]['id']);
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new TimeLineJobs(),
                    ));
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  //color: Color(0xFF0a2f52),
                  color: Colors.transparent,
                  child: new Text(
                    'Apply  ',
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
                    'assets/lolo.jpg',
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
                      style: Theme.of(context).textTheme.headline4,
//                      TextStyle(
//                        fontWeight: FontWeight.bold,
//                        //fontSize: 20.0,
//                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "${widget.list[widget.index]['jtype']}",textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Divider(thickness: 2.0, ),

                    Wrap(
                      //runSpacing: 2.0, // gap between lines
                      direction: Axis.horizontal,
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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                        SizedBox(
                          width: 80.0,
                        ),
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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(thickness: 2.0, ),
                    Wrap(
//                          spacing: 3.0,
//                          runSpacing: 2.0, // gap between lines
                      direction: Axis.horizontal,
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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.location_city,
                          color: Color(0xff2E86C1),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${widget.list[widget.index]['city']}",
                          style: TextStyle(
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                      ],
                    ),






                    SizedBox(
                      height: 10.0,
                    ),


                    Divider(thickness: 2.0, ),
                    Wrap(
                      runSpacing: 2.0, // gap between lines
                      direction: Axis.horizontal,
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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),

                        SizedBox(
                          width: 80.0,
                        ),

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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10.0,
                    ),



                    Divider(thickness: 2.0, ),

                    Wrap(
                      runSpacing: 2.0, // gap between lines
                      direction: Axis.horizontal,
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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),

                        SizedBox(
                          width: 80.0,
                        ),

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
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                      ],
                    ),


                    SizedBox(height: 50.0),
                    /*  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: new RaisedButton(
                            elevation: 10.0,
                            onPressed: () {
                              databaseHelper.applyFunding(widget.list[widget.index]['id']);
                              Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) => new TimeLineIdea(),
                              )
                              );
                            } ,
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color(0xFF0a2f52),
                            child: new Text(
                              'Funding',
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


                      ],
                    )*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );









/*    return Scaffold(
      appBar: AppBar(
        title: Text('Show Job'),
        centerTitle: true,
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
                    'assets/Prlogo.png',
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                decoration: BoxDecoration(
                    color : Color(0xFFe7e7e7),
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "${ widget.list[widget.index]['title']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4,
//                      TextStyle(
//                        fontWeight: FontWeight.bold,
//                        //fontSize: 20.0,
//                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "${widget.list[widget.index]['jtype']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Divider(thickness: 2.0, color: Colors.black),
                    Text(
                      "Job Category : ${widget.list[widget.index]['catagory']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      "Address : ${widget.list[widget.index]['address']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      "Salary : ${widget.list[widget.index]['salary']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      "Gander : ${widget.list[widget.index]['gander']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),


                    SizedBox(height: 10.0),
                    Text(
                      "Country : ${widget.list[widget.index]['country']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),


                    SizedBox(height: 10.0),
                    Text(
                      "city : ${widget.list[widget.index]['city']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      "Qualification : ${widget.list[widget.index]['qualification']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),


                    SizedBox(height: 10.0),
                    Text(
                      "Experience : ${widget.list[widget.index]['experience']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      "Qualification : ${widget.list[widget.index]['qualification']}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Description : ${widget.list[widget.index]['description']}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: new RaisedButton(
                            elevation: 20.0,
                            onPressed: () =>
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                      builder: (BuildContext context) => new EditData(list:widget.list , index:widget.index),
                                    )
                                ),
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color(0xFF0a2f52),
                            child: new Text(
                              'Edit',
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
                        new Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        Container(
                          height: 50,
                          child: new RaisedButton(
                            elevation: 20.0,
                            onPressed: () {
                              databaseHelper.deleteDataJobs(widget.list[widget.index]['id']);
                              Navigator.of(context).push(
                                  new MaterialPageRoute(
                                    builder: (BuildContext context) => new TimeLineJobs(),
                                  )
                              );
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color(0xFF0a2f52),
                            child: new Text(
                              'Delete',
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
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );*/





/*
    return MaterialApp(
      title: 'Show Jobs',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2E86C1),
          title:  Text('Show Jobs'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: ()=>Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new EmployeeTimeline(),
                  )
              ),
            )
          ],
        ),



        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[


          Container(
                height: 50,
                child: new Text(
                  "Idea Title : ${ widget.list[widget.index]['id']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: new Text(
                  "Idea Title : ${ widget.list[widget.index]['user_id']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: new Text(
                  "Idea Title : ${ widget.list[widget.index]['title']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Job Type : ${widget.list[widget.index]['jtype']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Job Category : ${widget.list[widget.index]['catagory']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Address : ${widget.list[widget.index]['address']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Salary : ${widget.list[widget.index]['salary']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Gander : ${widget.list[widget.index]['gander']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Country : ${widget.list[widget.index]['country']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "city : ${widget.list[widget.index]['city']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Qualification : ${widget.list[widget.index]['qualification']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Experience : ${widget.list[widget.index]['experience']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Description : ${widget.list[widget.index]['description']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new Text(
                  " Created at : ${widget.list[widget.index]['created_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                height: 50,
                child: new Text(
                  " Updated at : ${widget.list[widget.index]['updated_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: new RaisedButton(
                      elevation: 20.0,
                      onPressed: () =>
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => new EditData(list:widget.list , index:widget.index),
                              )
                          ),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFF0a2f52),
                      child: new Text(
                        'Edit',
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
                  new Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    height: 50,
                    child: new RaisedButton(
                      elevation: 20.0,
                      onPressed: () {

                        databaseHelper.applyjop(widget.list[widget.index]['id']);

                        Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) => new EmployeeTimeline(),
                            )
                        );
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFF0a2f52),
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
                ],
              )
            ],
          ),
        ),
      ),
    );*/
  }

//  void _showDialog(){
//    showDialog(
//        context:context ,
//        builder:(BuildContext context){
//          return AlertDialog(
//            title: new Text('Failed'),
//            content:  new Text('Check your email or password'),
//            actions: <Widget>[
//              new RaisedButton(
//
//                child: new Text(
//                  'Close',
//                ),
//
//                onPressed: (){
//                  Navigator.of(context).pop();
//                },
//
//              ),
//            ],
//          );
//        }
//    );
//  }
}