import 'package:successroad/UI/profile.dart';
import 'package:successroad/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/addidea.dart';
import 'package:successroad/ideas/showidea.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatefulWidget{

  Dashboard({Key key , this.title}) : super(key : key);
  final String title;

  @override
  DashboardState  createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  DatabaseHelper databaseHelper = new DatabaseHelper();



  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'auth_token';
    final value = token;
    prefs.setString(key, value);
  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
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

          body: new FutureBuilder<List>(
            future: databaseHelper.getData(),
            builder: (context ,snapshot){
              if(snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ItemList(list: snapshot.data)
                  : new Center(child: new CircularProgressIndicator(),);
            },
          )
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
        itemCount: list==null?0:list.length,
        itemBuilder: (context,i){
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowData(list:list , index:i)),
                );
              },
              child: new Card(
                child: new ListTile(
                  title: new Text(list[i]['title'],
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Color(0xFF0a2f52),
                          fontWeight: FontWeight.bold
                      )
                  ),
                  leading: new Icon(Icons.apps, color: Color(0xFF0a2f52),size: 35.5,),
                  subtitle: new Text('Idea Catagory : ${list[i]['ideacatagory']}',),
                ),
              ),
            ),
          );

        }
    );
  }
}