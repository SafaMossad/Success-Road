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
      /*drawer: Drawer(
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
      ),*/
      body: Dashboard(

      )
    );
  }
}
