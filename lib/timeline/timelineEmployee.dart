//import 'package:flutterapp/UI/profile.dart';
//import 'package:flutterapp/ui/login_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:successroad/UI/login_page.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/favorite/showfavoritejobs.dart';
import 'package:successroad/jobs/addjob.dart';
import 'package:successroad/jobs/showjob.dart';
import 'package:successroad/timeline/choocenavigationEmployee.dart';

class TimeLineJobs extends StatefulWidget {
  TimeLineJobs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TimeLineJobsState createState() => TimeLineJobsState();
}

final primary = Color(0xff1B4F72);
final secondary = Color(0xfff29a94);

class TimeLineJobsState extends State<TimeLineJobs> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  Log_out(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            Container(

              height: 280.0,
              child: Image.asset("assets/Office.png",),
            ),
            ListTile(
              title: Text(
                "Timeline",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Color(0xff1B4F72),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmployeeTimeline())),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Favorites",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.favorite,
                color: Color(0xff1B4F72),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowFavoriteJobs())),
            ),


            Divider(),
            ListTile(
              title: Text(
                "help&feedback",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.textsms,
                color: Color(0xff1B4F72),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Close",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.close,
                color: Color(0xff1B4F72),
              ),
              onTap: () async{
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new MyLoginPage(),
                    )
                );
              },
            )
          ],
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("TimeLine",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.asset(
                      "assets/SponsorTimlline.png",
                      fit: BoxFit.cover,
                    )),
                leading: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 25,
                  ),
                  tooltip: 'Add new entry',
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
                backgroundColor: Color(0xff1B4F72),
              ),
            ];
          },
          //backgroundColor: Color(0xffECF0F1 ),
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.only(top: 120),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: new FutureBuilder<List>(
                      future: databaseHelper.getAllJobData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? new ItemList(list: snapshot.data)
                            : new Center(
                                child: new CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
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
          return new Card(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowData(list: list, index: i)),
                  );
                },
                child: new Container(
                  decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 180,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 3, color: Colors.white30),
                            image: DecorationImage(
                                image: new ExactAssetImage('assets/Prlogo.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  Text(
                                    "Title: ",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    list[i]['title'],
                                    style: TextStyle(
                                        color: primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "catagory: ",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    list[i]["catagory"],
                                    style: TextStyle(
                                        color: primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Divider(),
                              Expanded(
                                child: Text(
                                  list[i]["description"],
                                  style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
