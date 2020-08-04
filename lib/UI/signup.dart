import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';

class Signupfinal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConfirmPass();
  }
}

class _ConfirmPass extends State<Signupfinal> {
  //bool enable = false;

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmpassword = new TextEditingController();

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty &&
          _confirmpassword.text.trim().isNotEmpty) {
        databaseHelper
            .signup(
          _emailController.text.trim().toLowerCase(),
          _passwordController.text.trim().toLowerCase(),
          _confirmpassword.text.trim().toLowerCase(),
        )
            .whenComplete(() {
          if (databaseHelper.status) {
            _showDialog();
            msgStatus = 'Check email or password';
          } else {
            Navigator.pushReplacementNamed(context, '/category');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0a2f52),
                Color(0xff2E86C1),
              ]),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 50, right: 15.0),
                  child: ClipPath(
                    clipper: Clipper(),
                    child: Container(
                      //margin: EdgeInsets.only(left:20,top: 50),
                      width: MediaQuery.of(context).size.width * 1,
                      height: 500,
                      decoration: BoxDecoration(

                        color: Color(0xfffbf7f5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 90,
                          ),

                          //Email
                          Container(
                              padding: EdgeInsets.only(left: 20),
                              child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email address",
                                    hintStyle: TextStyle(
                                      color: Color(0xff1B4F72),
                                    ),
                                    icon: Icon(
                                      Icons.email,
                                      color: Color(0xff1B4F72),

                                    )),
                              )),
                          Container(
                            child: Divider(
                              color: Color(0xff1B4F72),
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 10.0),
                          ),

                          //Password
                          Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Color(0xff1B4F72),

                                      ),
                                      icon: Icon(
                                        Icons.lock,
                                        color: Color(0xff1B4F72),

                                      ),
                                      border: InputBorder.none,
                                    ),
                                  )
                                ],
                              )),
                          Container(
                            child: Divider(
                              color: Color(0xff1B4F72),
                            ),
                          ),

                          //Confirmaation Password
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _confirmpassword,
                              keyboardType: TextInputType.visiblePassword,                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  color: Color(0xff1B4F72),

                                ),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock,
                                  color: Color(0xff1B4F72),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Divider(
                              color: Color(0xff1B4F72),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 115),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 540,

                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(onPressed:  _onPressed,
                      color: Color(0xff1B4F72),
                      child:Text('  Sign Up  ',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff1B4F72),

                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    /*  floatingActionButton: FloatingActionButton.extended(
        onPressed: _onPressed,
        label: Text(
          'Continue....',
          style: TextStyle(
            color: Color(0xff1B4F72),
          ),
        ),
        backgroundColor: Colors.grey.shade300,
      ),*/
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var X = 50.0;
    //round factor

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - X);
    path.quadraticBezierTo(0, size.height, X, size.height);
    path.lineTo(size.width - X, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - X);
    path.lineTo(size.width, X * 2);
    path.quadraticBezierTo(size.width - 10, X, size.width - X * 1.5, X * 1.5);
    path.lineTo(X * 0.6, size.height * 0.33 - X * 0.3);
    path.quadraticBezierTo(0, size.height * 0.33, 0, size.height * 0.33 + X);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
