import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/showoneapplyedIdea.dart';
import 'package:successroad/ideas/editidea.dart';

class CompanyDashboardIdeas extends StatefulWidget {

  @override
  CompanyDashboardIdeasState createState() => CompanyDashboardIdeasState();
}

class CompanyDashboardIdeasState extends State<CompanyDashboardIdeas> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1B4F72),
            title: Text("My Ideas main"),
            centerTitle: true,
          ),
          body: new FutureBuilder<List<dynamic>>(
            future: databaseHelper.getCurrenUserIdeas(),
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
  DatabaseHelper databaseHelper = new DatabaseHelper();

  List list;
  int index;
  ItemList({this.index , this.list}) ;
//  List list;
//
//  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/94393013-team-work-in-training-room-with-planning-board.jpg",
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      top: 0.0,
                      left: 20.0,
                      right: 20.0,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.slideshow,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "My Invest",
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
                              "id :${list[i]['id']}",
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
                      Wrap(
                        runSpacing: 2.0, // gap between lines
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
                            "Catagory: ${list[i]['ideacatagory']}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          Icon(
                            Icons.supervisor_account,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Managment:${list[i]['Management']}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      //Padding(padding: EdgeInsets.only(right: 50.0)),
                      Wrap(
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
                            "Address: ${list[i]['address']}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          Icon(
                            Icons.comment,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Funding: ${list[i]['funding']}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
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
                            " ${list[i]['ideaDescription']}.",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[



                          //Edit Button
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            //width: 150.0,
                            child: RaisedButton(
                              elevation: 20.0,
                              onPressed: () {
                                Navigator.of(context).push(
                                  new MaterialPageRoute(
                                    builder: (BuildContext context) => new EditData(list: list, index: i),
                                  )
                              );
                                print("Edit");
                              },
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Color(0xFF0a2f52),
                              child: Text(
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


                          SizedBox(
                            width: 25.0,
                          ),


                          //Delete Button
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            //width: 150.0,
                            child: RaisedButton(
                              elevation: 20.0,
                              onPressed: () {
                                databaseHelper.deleteData(list[i]['id']);
                                print("Delete");
                              },
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Color(0xFF0a2f52),
                              child: Text(
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

//                          RaisedButton(
//                            onPressed: () {
//                              databaseHelper.deleteData(list[i]['id']);
////                              Navigator.of(context).push(
////                                  new MaterialPageRoute(
////                                    builder: (BuildContext context) => new Dashboard(),
////                                  )
////                              );
//                            },
//                            child: Text("delete"),
//                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            // elevation: 20.0,
                            onPressed: () {
                              // var databaseHelper=list[i]['id'];

                              Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ShowOneApplyIdea(list: list, index: i),
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
                                color: Colors.black,
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
