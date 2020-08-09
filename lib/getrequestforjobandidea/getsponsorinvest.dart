import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:successroad/api/databasehelper.dart';

class Showsponsorinvest extends StatefulWidget {
  @override
  _ShowsponsorinvestState createState() => _ShowsponsorinvestState();
}

class _ShowsponsorinvestState extends State<Showsponsorinvest> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9F9),
      body: new FutureBuilder<List<dynamic>>(
        future: databaseHelper.getSponsorinvest(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
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
                      Column(
                        children: <Widget>[

                          Row(
                            children: <Widget>[

                              Text("Status: ${list[i]["Responce"]}", style: TextStyle(fontSize: 20.0,
                                color: Color(0xFF0a2f52),
                                fontWeight: FontWeight.bold,),),
                            ],
                          )
                        ],
                      ),
                      Divider(color: Color(0xff2E86C1),),
                      SizedBox(
                        height: 5.0,
                      ),

                     Row(children: <Widget>[

                       Icon(
                         Icons.supervisor_account,
                         color: Color(0xff2E86C1),
                       ),
                       SizedBox(
                         width: 5.0,
                       ),

                       Text("Title :${list[i]["idea"]["title"]}",
                         style: TextStyle(fontSize: 15.0,
                           color: Color(0xFF0a2f52),
                           fontWeight: FontWeight.bold,),
                       ),
                     ],),
                      Divider(color: Color(0xff2E86C1),),
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
                              Text("Catagory: ${list[i]["idea"]["ideacatagory"]}",
                                style: TextStyle(fontSize: 15.0, color: Color(0xFF0a2f52)),),
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
                              Text("Managment: ${list[i]["idea"]["Management"]}",style:
                              TextStyle(fontSize: 15.0, color: Color(0xFF0a2f52)),),
                            ],
                          )
                        ],
                      ),


                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(),
                      //Divider(color: Color(0xff2E86C1),),
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
                              Text("Address: ${list[i]["idea"]["address"]}",style:
                              TextStyle(fontSize: 15.0, color: Color(0xFF0a2f52)),),
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
                              Text("Funding: ${list[i]["idea"]["funding"]}",style:
                              TextStyle(fontSize: 15.0, color: Color(0xFF0a2f52)),),
                            ],
                          )


                        ],
                      ),


                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(),
                      //Divider(color: Color(0xff2E86C1),),
//                      SizedBox(
//                        height: 10.0,
//                      ),

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
                                Text("${list[i]['ideaDescription']}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF0a2f52)),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xff2E86C1),),
              ],
            ),
          );
        });
  }
}
