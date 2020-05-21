/*
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:successroad/timeline/addidea.dart';
import 'package:successroad/timeline/addjob.dart';
import 'package:successroad/timeline/manageidea.dart';
import 'package:successroad/timeline/managejob.dart';
import './home.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  int _page = 0;

  Widget _ShowPage =new Home();

  Widget  _choocenPage(int page)
  {
    switch(page){
      case(0):
        return ManageJob();
        break;
      case(1):
        return ManageIdea();
        break;

      case(2):
        return Home();
        break;

      case(3):
        return AddIdea();
        break;

      case(4):
        return AddJobs();
        break;

      default :
        return Container(
          child: Center(
            child: Text ("no image found"),
          ),
        );




    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(

          index: 2 ,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add ,size: 30,),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.amberAccent,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 800),
          onTap: (int tappedIndex) {
            setState(() {
              _ShowPage=_choocenPage( tappedIndex);

            });
          },
        ),
        body: Container(

          color: Colors.blueAccent,
          child: Center(
            child: _ShowPage
          ),
        ));
  }
}*/
// ده شغال عادي بس عملتله كمنت علشان اجرب حاجه تانيه

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:successroad/UI/profile.dart';
import 'package:successroad/ideas/addidea.dart';
import 'package:successroad/ideas/dashboard.dart';
import 'package:successroad/jobs/addjob.dart';

import 'package:successroad/timeline/home.dart';


class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: TimeLineState(),
    );
  }
}

class TimeLineState extends StatefulWidget {
  @override
  _TimeLineStateState createState() => _TimeLineStateState();
}

class _TimeLineStateState extends State<TimeLineState> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(

        tabs: [

          TabData(
            iconData: Icons.home,
            title: "home",

          ),

          TabData(
              iconData: Icons.add_comment,
              title: "Add Idea",
              /*onclick: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ManageIdea()))*/
              //this on click for navigate to anothe page when click on it
              ),
          TabData(
            iconData: Icons.add,
            title: "Add job",

          ),
          TabData(
            iconData: Icons.person_pin,
            title: "Profile",
          ),
        ],
        initialSelection: 0,
        circleColor: Color( 0xff1B4F72),

        //key: bottomNavigationKey,
        onTabChangedListener: (position) {

          setState(() {
            currentPage = position;
          });
        },
      ),

    );
  }

  _getPage(int page) {

    switch (page) {

      case 0:
        return Home();
        break;


      case 1:
        return  AddIdea();
        break;
      case 2:
        return AddJobs();
        break;

      case 3:
        return Profile();
        break;

      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is nothing"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }
}
