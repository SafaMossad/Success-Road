//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/showoneapplyedIdea.dart';
import 'package:successroad/ideas/editidea.dart';

class ShowFavoriteIdeas extends StatefulWidget {
  List list;
  int index ;

  ShowFavoriteIdeas({ this.list,this.index});


  @override
  ShowFavoriteIdeasState createState() => ShowFavoriteIdeasState();
}

class ShowFavoriteIdeasState extends State<ShowFavoriteIdeas> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'get Favorite Jobs',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1B4F72),
            title: Text("get Favorite Ideas "),
            centerTitle: true,
          ),
          body: new FutureBuilder<List<dynamic>>(
            future: databaseHelper.getFavoriteIdea(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ItemList(list: snapshot.data)
                  : new Center(
                child: new CircularProgressIndicator(),
              );
            },
          )
      ),

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
              margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
              color: Color(0xffd8e2dc),
              child: Column(
                children: <Widget>[
                  /*Stack(
                    children: <Widget>[
                      Container(
                          height: 150,
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
                              "Show Favorite Ideas",
                              style: TextStyle(color: Colors.black87),
                            )
                          ],
                        ),
                      )
                    ],
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0, top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[


                        Text(
                          "Title :${list[i]['idea']['title']}",
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
                                  "Catagory: ${list[i]['idea']['ideacatagory']}",
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
                                  "funding:${list[i]['idea']['funding']}",
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

                        //Padding(padding: EdgeInsets.only(right: 50.0)),
                        Column(
                          children: <Widget>[
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
                                  "Management: ${list[i]['idea']['Management']}",
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
                                  "address: ${list[i]['idea']['address']}",
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
                                  Icons.description,
                                  color: Color(0xff2E86C1),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "Idea Description: ${list[i]['idea']['ideaDescription']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),
                                ),
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


