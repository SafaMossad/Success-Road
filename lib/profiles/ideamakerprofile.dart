import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/profileedit/ideaMakerEdit.dart';

import '../profileedit/ideaMakerEdit.dart';

class IdeaMakerProfile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<IdeaMakerProfile> {
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
      title: 'Dashboard',
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
                    ? new ProfileFinal(map: projectSnap.data)
                    :Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}

class ProfileFinal extends StatelessWidget {
  Map map;

  ProfileFinal({this.map});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade300,


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
                                            subtitle: Text("Idea Maker"),
                                          ),
                                          Padding(padding: EdgeInsets.only(left: 150),
                                            child: IconButton(
                                              icon: Icon(Icons.edit ,size: 25,),
                                              tooltip:'edit',
                                              //elevation: 20.0,
                                              onPressed: ()=> Navigator.of(context).push(
                                                  new MaterialPageRoute(
                                                    builder: (BuildContext context) => new IdeaMakerEditData(map),
                                                  )
                                              ),
                                              padding: EdgeInsets.all(10.0),

                                              color: Color(0xFF0a2f52),
                                            ),
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
                                    "Personal information",
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
                                  title: Text("Addree"),
                                  subtitle:Text("${map["addree"]}"),
                                  leading: Icon(Icons.add_location),
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

                                  title: Text("Mobile"),
                                  subtitle:Text("${map["mobile"]}"),
                                  leading: Icon(Icons.title),

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
                                  title: Text("Qualifiction"),
                                  subtitle:Text("${map["qualifiction"]}"),
                                  leading: Icon(Icons.person_add),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),

                                

                                ListTile(

                                  title: Text("Intersting Field"),
                                  subtitle:Text("${map["interstingfield"]}"),
                                  leading: Icon(Icons.textsms),

                                ),

                                Divider(

                                  thickness: 1.0,
                                ),


                                ListTile(
                                  title: Text("Idea makerBio"),
                                  subtitle:Text("${map["ideamakerBio"]}"),
                                  leading: Icon(Icons.calendar_view_day),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),


                                ListTile(
                                  title: Text("Website"),
                                  subtitle:Text("${map["Website"]}"),
                                  leading: Icon(Icons.subject),
                                ),

                                Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(

                                  title: Text("Size"),
                                  subtitle:Text("${map["size"]}"),
                                  leading: Icon(Icons.subject),

                                ),
                                Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(

                                  title: Text("Owner Name"),
                                  subtitle:Text("${map["ownernaem"]}"),
                                  leading: Icon(Icons.person),

                                ),
                                Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(

                                  title: Text("Owner Phono"),
                                  subtitle:Text("${map["ownerphono"]}"),
                                  leading: Icon(Icons.phone),

                                ),        Divider(

                                  thickness: 1.0,
                                ),

                                ListTile(

                                  title: Text("Owner Address"),
                                  subtitle:Text("${map["owneraddress"]}"),
                                  leading: Icon(Icons.location_on),

                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
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