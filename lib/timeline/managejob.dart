import 'addidea.dart';
import 'addjob.dart';
import 'package:flutter/material.dart';

import '../UI/login_page.dart';
import 'manageidea.dart';

class ManageJob extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ManageJobState();
  }
}

class ManageJobState extends State<ManageJob> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        //backgroundColor: Colors.cyan[100],

        body: new Container(
          child: new Center(
            child: new ListView(
              children: <Widget>[
                Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " manage iob",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),

                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),




                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),

                new Divider(
                  height: 5.0,
                ),


                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),

                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),

                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),

                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),


                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),


                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),



                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),


                new Divider(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: ListTile(
                        title: new Text(
                          " khaled",
                          //title: new Text("Date: $date",
                          style: new TextStyle(
                              fontSize: 15.5,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: new Text(
                          "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                          style: new TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(
                            "1",
                            style: new TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () => print('Edit'),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => print('Delete'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          // elevation: 12.0,
          child: Column(
            children: [
              Container(
                height: 290.0,
                //flex: 1,
                //child: Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.only(top: 20),
                //color: Colors.deepPurpleAccent,
                color: Color(0xFF0a2f52),
                //width: MediaQuery.of(context).size.width * 0.40,
                child: DrawerHeader(
                  //padding: EdgeInsets.only(top: 0),
                  //margin: EdgeInsets.only(left:  2),
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF0a2f52)),
                    image: DecorationImage(
                      image: AssetImage("image/logo.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),

//                  child: Text(
////                  "Main",
////                  style: TextStyle(fontSize: 30, color: Colors.white),
////                ),
                ),

                // ),
              ),
              Expanded(
                //flex: 1,
                child: ListView(children: [
                  Container(
                      color: Colors.white,
                      height: 500,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Dashboard",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.dashboard,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Add A New Job",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.add,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => AddJobs()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Add A New Idea",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.add,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => AddIdea()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Manage Jobs",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.business_center,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ManageJob()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Manage Idea",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.edit_attributes,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ManageIdea()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.edit,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),

                          FloatingActionButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage()),
                              );
                            },
                            tooltip: "Sign Out",
                            child: Icon(
                              Icons.call_missed,
                              size: 55.0,
                            ),
                            backgroundColor: Color(0xFF0a2f52),
                            //focusColor: Colors.pinkAccent,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          // Padding(padding: EdgeInsets.only(top: 10.0,right: 100.0)),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xFF337db1),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          )
                        ],
                      ))
                ]),
              ),
            ],
          ),
        ));
  }
}
