import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/dashboard.dart';
import 'package:successroad/ideas/editidea.dart';
import '../timeline/timelineidea.dart';



class ShowData extends StatefulWidget {
  List list;
  int index;

  ShowData({this.index, this.list});

  @override
  ShowDataState createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Idea'),
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
                        .applyFunding(widget.list[widget.index]['id']);
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new TimeLineIdea(),
                    ));
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  //color: Color(0xFF0a2f52),
                  color: Colors.transparent,
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
                      "${widget.list[widget.index]['ideacatagory']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Divider(thickness: 2.0, color: Colors.black),

                    Wrap(
                      //spacing: 1.0, // gap between adjacent chips
                      runSpacing: 2.0, // gap between lines
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          color: Color(0xff2E86C1),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${widget.list[widget.index]['funding']}",
                          style: TextStyle(
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                        SizedBox(
                          width: 80.0,
                        ),
                        Icon(
                          Icons.supervisor_account,
                          color: Color(0xff2E86C1),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${widget.list[widget.index]['Management']}",
                          style: TextStyle(
                              fontSize: 20.0, color: Color(0xFF0a2f52)),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    Wrap(
                      //spacing: 8.0, // gap between adjacent chips
                      runSpacing: 2.0, // gap between lines
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
                          width: 50.0,
                        ),
                      ],
                    ),

                    /*
                    Text(
                      "${widget.list[widget.index]['funding']}",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      "${widget.list[widget.index]['Management']}",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      "${widget.list[widget.index]['address']}",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),
                     */

                    SizedBox(
                      height: 10.0,
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.description,
                          color: Color(0xff2E86C1),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${widget.list[widget.index]['ideaDescription']}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
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

//    return MaterialApp(
//      title: 'Show Idea',
//      home: Scaffold(
//        appBar: AppBar(
//          actions: <Widget>[
//            IconButton(
//              icon: (Icon(
//                Icons.arrow_back,
//              )),
//              onPressed: () => Navigator.of(context).pop(),
//            )
//          ],
//        ),
//        body: Container(
//          child: ListView(
//            padding: const EdgeInsets.only(
//                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
//            children: <Widget>[
//              Container(
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(100)),
//                ),
//                height: 50,
//                child: new Text(
//                  "Idea Title : ${widget.list[widget.index]['title']}",
//                  textAlign: TextAlign.left,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                ),
//              ),
//              new Padding(
//                padding: new EdgeInsets.only(top: 30.0),
//              ),
//              Container(
//                height: 50,
//                child: new Text(
//                  "Idea Catagory : ${widget.list[widget.index]['ideacatagory']}",
//                  textAlign: TextAlign.left,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                ),
//              ),
//              new Padding(
//                padding: new EdgeInsets.only(top: 30.0),
//              ),
//              Container(
//                height: 50,
//                child: new Text(
//                  "Funding : ${widget.list[widget.index]['funding']}",
//                  textAlign: TextAlign.left,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                ),
//              ),
//              new Padding(
//                padding: new EdgeInsets.only(top: 30.0),
//              ),
//              Container(
//                height: 50,
//                child: new Text(
//                  "Management Type : ${widget.list[widget.index]['Management']}",
//                  textAlign: TextAlign.left,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                ),
//              ),
//              new Padding(
//                padding: new EdgeInsets.only(top: 30.0),
//              ),
//              Container(
//                height: 50,
//                child: new Text(
//                  "Address : ${widget.list[widget.index]['address']}",
//                  textAlign: TextAlign.left,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                ),
//              ),
//              new Padding(
//                padding: new EdgeInsets.only(top: 30.0),
//              ),
//              Container(
//                height: 50,
//                child: new Text(
//                  "Idea Description : ${widget.list[widget.index]['ideaDescription']}",
//                  textAlign: TextAlign.left,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                ),
//              ),
//              new Padding(
//                padding: new EdgeInsets.only(top: 44.0),
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//                    height: 50,
//                    child: new RaisedButton(
//                      elevation: 10.0,
//                      onPressed: () =>
//                          Navigator.of(context).push(new MaterialPageRoute(
//                        builder: (BuildContext context) => new EditData(
//                            list: widget.list, index: widget.index),
//                      )),
//                      padding: EdgeInsets.all(15.0),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(30.0),
//                      ),
//                      color: Color(0xFF0a2f52),
//                      child: new Text(
//                        'Edit',
//                        style: TextStyle(
//                          color: Colors.white,
//                          letterSpacing: 1.5,
//                          fontSize: 18.0,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: 'OpenSans',
//                        ),
//                      ),
//                    ),
//                  ),
//                  new Padding(
//                    padding: EdgeInsets.all(20),
//                  ),
//                  Container(
//                    height: 50,
//                    child: new RaisedButton(
//                      elevation: 20.0,
//                      onPressed: () {
//                        databaseHelper
//                            .applyFunding(widget.list[widget.index]['id']);
//                        /*  Navigator.of(context).push(
//                            new MaterialPageRoute(
//                              builder: (BuildContext context) => new Dashboard(),
//                            )
//                        );*/
//                      },
//                      padding: EdgeInsets.all(15.0),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(30.0),
//                      ),
//                      color: Color(0xFF0a2f52),
//                      child: new Text(
//                        'Funding',
//                        style: TextStyle(
//                          color: Colors.white,
//                          letterSpacing: 1.5,
//                          fontSize: 18.0,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: 'OpenSans',
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              )
//
//              /*    Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//                    height: 50,
//                    child: new FlatButton(
//                      onPressed: ()=>Navigator.of(context).push(
//                          new MaterialPageRoute(
//                            builder: (BuildContext context) => new EditData(list:widget.list , index:widget.index),
//                          )
//                      ),
//                      color: Colors.green,
//                      child: new Text(
//                        'Edit',
//                        style: new TextStyle(
//                          color: Colors.white,
//                        ),),
//                    ),
//                  ),
//
//                  Container(
//                    height: 50,
//                    child: new FlatButton(
//                      onPressed: (){
//                        databaseHelper.deleteData(widget.list[widget.index]['id']);
//                        Navigator.of(context).push(
//                            new MaterialPageRoute(
//                              builder: (BuildContext context) => new Dashboard(),
//                            )
//                        );
//                      },
//                      color: Colors.blue,
//                      child: new Text(
//                        'Delete',
//                        style: new TextStyle(
//                          color: Colors.red,
//                        ),),
//                    ),
//                  ),
//                ],
//              )*/
//            ],
//          ),
//        ),
//      ),
//    );
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
