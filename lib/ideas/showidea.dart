import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/dashboard.dart';
import 'package:successroad/ideas/editidea.dart';
import 'package:successroad/timeline/choocenavigationsponsor.dart';
import 'package:successroad/timeline/timelineideasponsor.dart';
import '../timeline/timelineideamaker.dart';



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
                    databaseHelper.applyFunding(widget.list[widget.index]['id']);
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new TimeLineSponsor(),
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

              Container(
                height: 50,
                child: new IconButton(

                 /* onPressed: () {
                    databaseHelper.applyFunding(widget.list[widget.index]['id']);
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new TimeLineSponsor(),
                    ));
                  },*/
                  padding: EdgeInsets.all(15.0),
                  //color: Color(0xFF0a2f52),
                  color: Colors.transparent,
                  icon: Icon(Icons.favorite,color: Colors.red,size: 15.0,),
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
                      "Title: ${widget.list[widget.index]['title']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      //style: Theme.of(context).textTheme.headline4,
//                      TextStyle(
//                        fontWeight: FontWeight.bold,
//                        //fontSize: 20.0,
//                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Idea Catagory: ${widget.list[widget.index]['ideacatagory']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    Divider(),

                    Column(
                      children: <Widget>[

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
                              "Funding: ${widget.list[widget.index]['funding']}",
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
                              Icons.supervisor_account,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Management: ${widget.list[widget.index]['Management']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        )


                      ],
                    ),

                    SizedBox(height: 10.0),
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
                              "Address: ${widget.list[widget.index]['address']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
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

                    SizedBox(height: 10.0),
                    Divider(),

                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Description :'),
                          ],
                        ),

                        Container(
                          //alignment: Alignment.topLeft,
                          child: Wrap(
                            children: <Widget>[
                              Text("${widget.list[widget.index]['ideaDescription']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Color(0xFF0a2f52)),)
                            ],
                          ),
                        ),
                      ],
                    ),

//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Icon(
//                          Icons.description,
//                          color: Color(0xff2E86C1),
//                        ),
//                        SizedBox(
//                          width: 5.0,
//                        ),
//                        Text(
//                          "${widget.list[widget.index]['ideaDescription']}",
//                          textAlign: TextAlign.left,
//                          style: TextStyle(
//                            fontSize: 15.0,
//                          ),
//                        ),
//                      ],
//                    ),

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
