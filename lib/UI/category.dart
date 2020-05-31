import 'package:flutter/material.dart';
//import 'package:login_page/utilities/constants.dart';
import '../UI/employee_reg.dart';
import '../UI/idea_maker.dart';
import '../UI/sponsor.dart';

class Tabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Tabs();
  }
}

class _Tabs extends State<Tabs> {

  //ده الي هيتحطلي من البدايه


  //
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( length: 3, child:Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff5DADE2),
        title: Text("Welcome to Sign Up"),
        centerTitle: true,
        bottom: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.wb_incandescent,color: Color(0xff1B4F72),size: 35.0,),
            text: "Idea Maker",
          ),
          Tab(
            icon: Icon(Icons.directions_walk,color: Color(0xff1B4F72),size: 35.0,),
            text: "Sponsor",
          ),

          Tab(
            icon: Icon(Icons.attach_money,color: Color(0xff1B4F72),size: 35.0,),
           text: "Employee",
          ),

        ]),
      ),
      // yellow backgroundColor: Color(0xffF7DC6F),
      backgroundColor: Color(0xff1B4F72),
      body: TabBarView(
        children: <Widget>[
          IdeaMaker(),
          Sponsor(),
          Employee(),


        ],
      ),
    ),);
  }
}