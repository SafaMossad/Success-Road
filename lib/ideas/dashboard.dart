//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
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
            padding: EdgeInsets.only(top: 10.0),
            child: Card(
              margin: EdgeInsets.only(right: 5.0,left: 5.0,bottom: 10.0),
            //  borderOnForeground: true,
              color: Colors.white,
              child:  Column(

                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.only(top: 20.0),
                          color: Colors.white,
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/94393013-team-work-in-training-room-with-planning-board.jpg",
                            fit: BoxFit.fill,
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
                        left: 16.0, right: 16.0, bottom: 8.0, top: 15.0),
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
                                  "Catagory: ${list[i]['ideacatagory']}",
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
                                  "Managment:${list[i]['Management']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
                                ),
                              ],
                            ),
//                          SizedBox(
//                            width: 50.0,
//                          ),

                          ],
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(

                        ),
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
                                  "Address: ${list[i]['address']}",
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
                                  Icons.monetization_on,
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
                              Text( "Description: ${list[i]['ideaDescription']}",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xFF0a2f52)
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 25.0,
                        ),
                        /*   Column(
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
                              Text('Description : ${list[i]['ideaDescription']}'),                            ],
                          ),

                          Container(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              children: <Widget>[
                                Icon(
                                  Icons.comment,
                                  color: Color(0xff2E86C1),
                                ),
                                Text( "Descriptioncgdfgdfgfgffggdfgdfgdfgdfgdfgdfgdfgdfgdfgfgdddddf :${list[i]['ideaDescription']}",
                                    style: TextStyle(
                                    fontSize: 15.0,
                                        color: Color(0xFF0a2f52)),)
                              ],
                            ),
                          ),
                     */
                        /*     Text(
                            "Description: ${list[i]['ideaDescription']}.",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),*//*
                        ],
                      ),*/
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
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton.icon(onPressed: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                      builder: (BuildContext context) => new EditData(list: list, index: i),
                                    )
                                );
                                print("Edit");
                              },
                                  icon: Icon(Icons.edit,color: Color(0xff1B4F72),size: 20.0,),
                                  label: Text("Edit")),

                              SizedBox(width: 10.0,),



                              FlatButton.icon(onPressed:() {
                                databaseHelper.deleteData(list[i]['id']);
                                print("Delete");
                              },
                                  icon: Icon(Icons.delete,color: Color(0xff1B4F72),size: 20.0,),
                                  label: Text("Delete")),
                              SizedBox(width: 10.0,),

                              FlatButton.icon(onPressed:() {
                                // var databaseHelper=list[i]['id'];

                                Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new ShowOneApplyIdea(list: list, index: i),
                                ));
                                print("Apply Req");
                              },
                                  icon: Icon(Icons.playlist_add,color: Color(0xff1B4F72),size: 20.0,),
                                  label: Text("Apply Req"))
                            ],

                          ),
                        )

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
            )
          );
        });
  }
}
