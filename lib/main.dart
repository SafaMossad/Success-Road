import 'dart:developer';
import 'package:successroad/UI/forget_password.dart';
import 'package:successroad/UI/profile.dart';
import 'package:successroad/UI/signup.dart';
import 'package:successroad/ideas/showidea.dart';
import 'package:successroad/timeline/home.dart';
import 'package:successroad/timeline/choocenavigation.dart';
import "package:flutter/material.dart";
import './UI/category.dart';
import './UI/login_page.dart';
import './UI/idea_maker.dart';
import './UI/employee_reg.dart';
import './UI/sponsor.dart';

void main() {
  runApp(
      MaterialApp(
    // title: "Login Page",
    home: Navigation(),

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
        "/timeline": (BuildContext context) => new Timeline(),
        "/profile":(BuildContext context)=> new Profile(),
        "/showidea":(BuildContext context)=> new ShowData(),
        "/signup":(BuildContext context)=> new Signup(),



      },

    );
  }
}


