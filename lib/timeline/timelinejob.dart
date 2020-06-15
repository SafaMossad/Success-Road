//import 'package:flutterapp/UI/profile.dart';
//import 'package:flutterapp/ui/login_page.dart';

import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';

/*import '../jobs/addjob.dart';
import '../profiles/emmployeeprofile.dart';*/
//import 'package:shared_preferences/shared_preferences.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xfff0f0f0),
      /*floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context) => new AddJobs(),
            )
        ),
      ),*/
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
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
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

//                      IconButton(
//                        onPressed: () {},
//                        icon: Icon(
//                          Icons.menu,
//                          color: Colors.white,
//                        ),
//                      ),



                      Text(
                        "TimeLine",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),


                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],

          ),

        ),
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
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => ShowData(list:list , index:i)),
//                );
              },
              child: new Container(
                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5),
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
                        margin: EdgeInsets.only(top: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: Colors.white),
                          image: DecorationImage(
                              image: new ExactAssetImage('assets/Prlogo.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                      )
                    ]
                ),
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
