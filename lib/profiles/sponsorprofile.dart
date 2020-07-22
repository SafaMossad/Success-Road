import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/profileedit/sponsorEdit.dart';

import '../profileedit/sponsorEdit.dart';

class SponsorProfile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<SponsorProfile> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  //final prefs = await SharedPreferences.getInstance();

//  @override
//  void initState()  async{
//    super.initState();
//    final SharedPreferences prefsidid = await SharedPreferences.getInstance();
//    var idis = prefsidid.getInt('id now is');
//    print('ID : $idis');
//    databaseHelper.getProfile();
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SponsorProfile',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1B4F72),
            title: Text("profile"),
            centerTitle: true,
          ),
          body: new FutureBuilder<Map<String,dynamic>>(
            future: databaseHelper.getProfile(),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == null) {
                print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }else
                return projectSnap.hasData
                    ? new ProfileFinall(map: projectSnap.data)
                    :Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}

class ProfileFinall extends StatelessWidget {
  Map map;

  ProfileFinall({this.map});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            ListView.builder(
//                itemCount: list == null ? 0 : list.length,
//                itemBuilder: (context, i) {
//                  return Container(
//                      child: ListView(
//                    padding: const EdgeInsets.only(
//                        top: 62, left: 12.0, right: 12.0, bottom: 12.0),
//                    children: <Widget>[
//
//
//                      Container(
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(100)),
//                        ),
//                        height: 50,
//                        child: new Text(
//                          "Idea Title : ${list[i]['name']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold, fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['jobtybe']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['jobcategory']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['address']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['salary']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['Gander']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['Qualifcation']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['mobile']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['Degree']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['Indestry']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//                      new Padding(padding: new EdgeInsets.only(top: 30.0),),
//                      Container(
//                        height: 50,
//                        child: new Text(
//                          "Idea Catagory : ${list[i]['Exprense']}",
//                          textAlign: TextAlign.left,
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
//                        ),
//                      ),
//
//
//
//
//
//                    ],
//                  ));
//                }

      body: new ListView.builder(
          itemCount: map==null?0:1,
          itemBuilder: (context,i){
            return new Container(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(16.0),
                                margin: EdgeInsets.only(top: 16.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 96.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          //name of user
                                          Text("Welcome : ${map["name"]}",
                                            style: Theme.of(context).textTheme.title,
                                          ),
                                          ListTile(
                                            contentPadding: EdgeInsets.all(0),
                                            //email of user
                                            title: Text("User Type"),
                                            //age of user
                                            subtitle: Text("Sponsor"),
                                          ),
                                          Padding(padding: EdgeInsets.only(left: 150),


                                            child: IconButton(
                                              icon: Icon(Icons.edit ,size: 25,),
                                              tooltip:'edit',
                                              //elevation: 20.0,
                                              onPressed: ()=> Navigator.of(context).push(
                                                  new MaterialPageRoute(
                                                    builder: (BuildContext context) => new SponsorEditData(map),
                                                  )
                                              ),
                                              padding: EdgeInsets.all(10.0),
                                              /* shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),*/
                                              color: Color(0xFF0a2f52),
                                              /*    child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 1.5,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'OpenSans',
                                                ),
                                              ),*/
                                            ),

                                        /*    child: RaisedButton(
                                              elevation: 20.0,
                                              onPressed: ()=> Navigator.of(context).push(
                                                  new MaterialPageRoute(
                                                    builder: (BuildContext context) => new SponsorEditData(map),
                                                  )
                                              ),
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
                                            ),*/


                                          )

                                        ],


                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                  ],
                                ),
                              ),

                              Container(
                                  padding: EdgeInsets.only(top: 40.0,left: 20.0),
                                  height: 180,
                                  width:100,
                                  child: Image.asset(
                                    "assets/Lawyer-amico.png",
                                    fit: BoxFit.fill,
                                  )),
                            ],
                          ),
                          SizedBox(height: 20.0),

                          //user info from regestration
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "User information",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Divider(),
                                ListTile(

                                  title: Text("Name"),
                                  subtitle:Text("${map["name"]}"),
                                  leading: Icon(Icons.person_outline),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),


                                ListTile(
                                  title: Text("Address"),
                                  subtitle:Text("${map["Address"]}"),
                                  leading: Icon(Icons.title),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),


                                ListTile(
                                  title: Text("Gender"),
                                  subtitle:Text("${map["Gander"]}"),
                                  leading: Icon(Icons.location_on),
                                ),




                                Divider(

                                  thickness: 1.0,
                                ),



                                ListTile(
                                  title: Text("phone"),
                                  subtitle:Text("${map["phone"]}"),
                                  leading: Icon(Icons.phone),
                                ),

                              ],
                            ),
                          ),





                          SizedBox(height: 20.0),



                          //user info from regestration
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "Field Information",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Divider(),





                                ListTile(
                                  title: Text("Catagory"),
                                  subtitle:Text("${map["Catagory"]}"),
                                  leading: Icon(Icons.add_location),
                                ),


                                Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(
                                  title: Text("Funding"),
                                  subtitle:Text("${map["Funding"]}"),
                                  leading: Icon(Icons.person_add),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(
                                  title: Text("Typemanagment"),
                                  subtitle:Text("${map["Typemanagment"]}"),
                                  leading: Icon(Icons.textsms),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(
                                  title: Text("Typemanagment"),
                                  subtitle:Text("${map["sexprience"]}"),
                                  leading: Icon(Icons.textsms),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(
                                  title: Text("Typemanagment"),
                                  subtitle:Text("${map["sponcerBio"]}"),
                                  leading: Icon(Icons.textsms),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );

          }
      ),
    );
  }
}