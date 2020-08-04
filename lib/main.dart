import 'package:successroad/UI/forget_password.dart';
import 'package:successroad/UI/signup.dart';
import 'package:successroad/ideas/showidea.dart';
import 'package:successroad/profiles/emmployeeprofile.dart';
import 'package:successroad/profiles/ideamakerprofile.dart';
import 'package:successroad/profiles/sponsorprofile.dart';
import 'package:successroad/timeline/choocenavigationEmployee.dart';
import 'package:successroad/timeline/choocenavigationsponsor.dart';
import 'package:successroad/timeline/ideahome.dart';
import 'package:successroad/timeline/choocenavigationIdeaMaker.dart';
import "package:flutter/material.dart";
import './UI/category.dart';
import './UI/login_page.dart';
import 'Registration/idea_maker.dart';
import 'Registration/employee_reg.dart';
import 'Registration/sponsor.dart';

void main() {
  runApp(
      MaterialApp(
    // title: "Login Page",
    home: Navigation(),
        title: "Success Road",

  ));
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Success Road",
      home: new MyLoginPage(),
      routes: <String, WidgetBuilder>{
        "/login_page": (BuildContext context) => new MyLoginPage(),
        "/category": (BuildContext context) => new Tabs(),
        "/idea_maker": (BuildContext context) => new IdeaMaker(),
        "/sponsor": (BuildContext context) => new Sponsor(),
        "/employee": (BuildContext context) => new Employee(),
        "/home": (BuildContext context) => new Home(),
        "/ForgetPassword": (BuildContext context) => new ForgetPassword(),
        "/IdeaMakertimeline": (BuildContext context) => new IdeaMakerTimeline(),
        "/Sponsortimeline": (BuildContext context) => new SponsorTimeline(),
        "/Employeetimeline": (BuildContext context) => new EmployeeTimeline(),

        "/IdeaMakerprofile":(BuildContext context)=> new IdeaMakerProfile(),
        "/Sponsorprofile":(BuildContext context)=> new SponsorProfile(),
        "/Employeeprofile":(BuildContext context)=> new EmployeeProfile(),

        "/showidea":(BuildContext context)=> new ShowData(),
        "/signup":(BuildContext context)=> new Signupfinal(),
        //adding test commit
      },

    );
  }
}


