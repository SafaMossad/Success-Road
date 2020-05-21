import 'package:flutter/material.dart';
import 'package:successroad/UI/profile.dart';
import 'package:successroad/ideas/dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* drawer: Drawer(

        child: Column(
          children: [
            Container(
              height: 290.0,
              alignment: Alignment.center,
              color: Color(0xFF0a2f52),
              //color:Color(0xffEC7063),
              //color: Colors.deepPurpleAccent,
              child: DrawerHeader(
                //padding: EdgeInsets.only(top: 0),
                //margin: EdgeInsets.only(left:  2),
                decoration: BoxDecoration(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageJob()),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageIdea()),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyLoginPage()),
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
      ),*/
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff1B4F72),
              ),
              accountName: Text("Safa"),
              accountEmail: Text("Eng:Safa El-Helely"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/IMG_20190815_184001.jpg'),
              ),
            ),
            ListTile(
              title: Text("Account",style: TextStyle(color: Color(0xff1B4F72),),),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff1B4F72),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile())),
            ),
            Divider(),
            ListTile(
              title: Text("Favorites",style: TextStyle(color: Color(0xff1B4F72),),),
              trailing: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Setting",style: TextStyle(color: Color(0xff1B4F72),),),
              trailing: Icon(
                Icons.settings,
                color: Color(0xff1B4F72),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("About Us",style: TextStyle(color: Color(0xff1B4F72),),),
              trailing: Icon(
                Icons.filter_frames,
                color: Color(0xff1B4F72),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("help&feedback",style: TextStyle(color: Color(0xff1B4F72),),),
              trailing: Icon(
                Icons.textsms,
                color: Color(0xff1B4F72),
              ),
            ),
            Divider(),
            ListTile(
                title: Text("Close",style: TextStyle(color: Color(0xff1B4F72),),),
                trailing: Icon(
                  Icons.close,
                  color: Color(0xff1B4F72),
                ),
                onTap: () => Navigator.of(context).pop()),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff1B4F72),
        title: Text("Time Line"),
        centerTitle: true,
      ),
      body: Dashboard()
    );
  }
}
