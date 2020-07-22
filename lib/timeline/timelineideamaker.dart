//import 'package:flutterapp/UI/profile.dart';
//import 'package:flutterapp/ui/login_page.dart';
/*
import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';

import '../ideas/showidea.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class TimeLineIdea extends StatefulWidget {
  TimeLineIdea({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TimeLineIdeaState createState() => TimeLineIdeaState();
}

final primary = Color(0xff1B4F72);
final secondary = Color(0xfff29a94);

class TimeLineIdeaState extends State<TimeLineIdea> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              title: Text(
                "Account",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff1B4F72),
              ),
              onTap: () => {},
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
                color: Colors.red,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Setting",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.settings,
                color: Color(0xff1B4F72),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "About Us",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.filter_frames,
                color: Color(0xff1B4F72),
              ),
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
                onTap: () => Navigator.of(context).pop()),
          ],
        ),
      ),
      backgroundColor: Color(0xFFdadada),
      body: CustomScrollView(

        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 180.0,
            backgroundColor: Colors.cyan,
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Text("Type your Location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Bouddha, Kathmandu",
                      border: InputBorder.none,
                      icon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            ),
            stretch: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white70,
                    // padding: EdgeInsets.only(top: 120),
                   // height: MediaQuery.of(context).size.height,
                   // width: double.infinity,
                    child: new FutureBuilder<List>(
                      future: databaseHelper.getDataIdeaHome(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? new ItemList(list: snapshot.data)
                            : new Center(
                                child: new CircularProgressIndicator(),
                              );
                      },
                    ),
//                  child: ListView.builder(
//                      itemCount: schoolLists.length,
//                      itemBuilder: (BuildContext context, int index) {
//                        return buildList(context, index);
//                      }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      /*SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 120),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: new FutureBuilder<List>(
                  future: databaseHelper.getDataIdeaHome(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new ItemList(list: snapshot.data)
                        : new Center(
                      child: new CircularProgressIndicator(),
                    );
                  },
                ),
//                  child: ListView.builder(
//                      itemCount: schoolLists.length,
//                      itemBuilder: (BuildContext context, int index) {
//                        return buildList(context, index);
//                      }),
              ),

            ],
          ),
        ),
      ),*/
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
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () {
                print('khaled');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowData(list: list, index: i)),
                );
              },
              child: new Container(
                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 180,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: Colors.white),
                          image: DecorationImage(
                              image: new ExactAssetImage('assets/Prlogo.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              list[i]['title'],
                              style: TextStyle(color: primary, fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]['title'],
                              style: TextStyle(color: primary, fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]['title'],
                              style: TextStyle(color: primary, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ]),

//                child: new ListTile(
//                  title: new Text(list[i]['title'],
//                      style: TextStyle(
//                          fontSize: 18.0,
//                          color: Color(0xFF0a2f52),
//                          fontWeight: FontWeight.bold)),
//                  leading: new Icon(
//                    Icons.apps,
//                    color: Color(0xFF0a2f52),
//                    size: 35.5,
//                  ),
//                  subtitle: new Text(
//                    'Idea Catagory : ${list[i]['ideacatagory']}',
//                  ),
//                ),
              ),

              /*
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 110,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 3, color: secondary),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(schoolLists[index]['logoText']),
                              fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(list[i]['title'],
                            style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: secondary,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(list[i]['jtype'],
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 13,
                                      letterSpacing: .3)),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.school,
                                color: secondary,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(list[i]['catagory'],
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 13,
                                      letterSpacing: .3)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

               */
            ),
          );
        });
  }
}
*/

//import 'package:flutterapp/UI/profile.dart';
//import 'package:flutterapp/ui/login_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:successroad/UI/login_page.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/dashboard.dart';
import 'package:successroad/jobs/addjob.dart';
import 'package:successroad/jobs/dashboard.dart';
/*
import 'package:successroad/timeline/choocenavigationIdeaMaker.dart';
*/

import '../ideas/showidea.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class TimeLineIdea extends StatefulWidget {
  TimeLineIdea({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TimeLineIdeaState createState() => TimeLineIdeaState();
}

final primary = Color(0xff1B4F72);
final secondary = Color(0xfff29a94);

class TimeLineIdeaState extends State<TimeLineIdea> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  Log_out(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
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
              title: Text(
                "Account",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff1B4F72),
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddJobs())),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Show ideas",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.settings,
                color: Color(0xff1B4F72),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyDashboardIdeas())),
            ),
            Divider(),
            ListTile(
              title: Text(
                "show jobs",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.settings,
                color: Color(0xff1B4F72),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyDashboardjobs())),
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
                color: Colors.red,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Setting",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.settings,
                color: Color(0xff1B4F72),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "About Us",
                style: TextStyle(
                  color: Color(0xff1B4F72),
                ),
              ),
              trailing: Icon(
                Icons.filter_frames,
                color: Color(0xff1B4F72),
              ),
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
              onTap: () {
                Log_out('0');
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
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
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
//                  actions: < Widget > [
//                    IconButton(
//                      icon: const Icon(Icons.add_circle),
//                      tooltip: 'Add new entry',
//                      onPressed: () { /* ... */ },
//                    ),
//                  ]
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
                      future: databaseHelper.getDataIdeaHome(),
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
          return new Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
            child: new GestureDetector(
              onTap: () {
                //print('khaled');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowData(list: list, index: i)),
                );
              },
              child: new Container(
                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                //height of white container
                height: 150,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: Colors.white),
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
                            Text(
                              list[i]['title'],
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]['title'],
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]['title'],
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
