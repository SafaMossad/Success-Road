import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';


class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MySignup();
  }
}

class _MySignup extends State<Signup> {
  @override
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';


  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmpassword = new TextEditingController();


  _onPressed(){
    setState(() {
      if(
      _emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty &&
          _confirmpassword.text.trim().isNotEmpty ){
        databaseHelper.signup(

            _emailController.text.trim().toLowerCase(),
            _passwordController.text.trim().toLowerCase(),
          _confirmpassword.text.trim().toLowerCase(),
        ).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
          }else{
            Navigator.pushReplacementNamed(context, '/category');


          }
        });
      }
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      // yellow backgroundColor: Color(0xffF7DC6F),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Stack(
            children: <Widget>[



              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),

                    Container(
                      // padding: EdgeInsets.only(left: 5.0),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Welcome To Success Road',
                                  style: TextStyle(

                                      fontFamily: 'maintitle',
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,

                                      //fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              SizedBox(
                                height: 20,
                              ),
                              Text(' Please Enter Your Basic Information',
                                  style: TextStyle(
                                      fontFamily: 'maintitle',
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20.0)),
                            ],
                          )),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 250,

              ),

            ],
          ),

          Center(

            child: Container(
              width: 360,
              padding: EdgeInsets.only(bottom: 50.0),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),

                color:Color(0xFFdadada),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Color(0xFF0a2f52),
                        child: Icon(Icons.person,color: Colors.white,),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.0,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: _emailController,

                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                          icon: Icon(Icons.lock, color: Colors.white70,)
                      ),
                    ),
                  ),
                  Container(child: Divider(color: Colors.black),
                    padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _passwordController,

                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "password",
                            hintStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            icon: Icon(Icons.lock, color: Colors.white70,)
                        ),
                      )
                  ),
                  Container(child: Divider(color: Colors.black),
                    padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _confirmpassword,

                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                            icon: Icon(Icons.lock, color: Colors.white70,)
                        ),
                      )
                  ),
                ],
              ),
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onPressed,

        label: Text('Continue....'),

        backgroundColor: Color(0xFF0a2f52),
      ),
    );
  }


  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(

                child: new Text(
                  'Close',
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }
}
