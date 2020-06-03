import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:successroad/UI/signup.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/jobs/addjob.dart';
import 'package:successroad/timeline/choocenavigation.dart';

class MyLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyLoginPage();
  }
}

class _MyLoginPage extends State<MyLoginPage> {
  /* Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color(0xFF0a2f52),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xFF8b8b8b),
              ),
              labelText: "Email",
              labelStyle: kLabelStyle,
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassowrd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            //keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color(0xFF0a2f52),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF8b8b8b),
              ),
              labelText: "Password",
              labelStyle: kLabelStyle,
              hintText: 'Enter yourPassword',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 200.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF0a2f52),
        child: Text(
          'LOG IN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 300.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context)
              .pushNamed("/category");
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        //color: Color(0xFF0a2f52),
        child: Text(
          'Create New Account',
          style: TextStyle(
            color: Color(0xFF0a2f52),
            letterSpacing: 2.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildForgetPass() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 300.0,
      child: RaisedButton(
        elevation: 10.0,
        onPressed: () => print('Forget Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
       // color: Color(0xFF0a2f52),
        child: Text(
          'Forget Password',
          style: TextStyle(
            color: Color(0xFF0a2f52),
            letterSpacing: 2.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }*/

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    if (value != '0') {
     /* Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new Timeline(),
         )
      );*/

    }
  }

  @override
  initState() {
    read();
  }

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        databaseHelper.loginData(_emailController.text.trim().toLowerCase(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.status) {
            _showDialog();
            msgStatus = 'Check email or password';
          }
          else {
            if (databaseHelper.ideamaker) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Timeline()));
              print("U R fucken ideamaker");

            }
         else if (databaseHelper.sponsor) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Signup()));
            print("U R fucken Sponsor");

          }
          else  if (databaseHelper.employee) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddJobs()));
              print("U R fucken emp");

            }
            //Navigator.pushReplacementNamed(context, '/dashboard');

          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // yellow backgroundColor: Color(0xffF7DC6F),
      backgroundColor: Color(0xFFdadada),
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFF0a2f52),
                    Color(0xff2E86C1),
//                    Color(0xff85C1E9),
//                    Color(0xff5DADE2),
                    Color(0xff85C1E9)
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFF0a2f52),
                    Color(0xff2E86C1),
//                        Color(0xffe6e6e6),
                    Color(0xFFdadada),
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          //color: Color(0xFF337db1),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/Prlogo.png",
                          height: 160.0,
                          width: 200.0,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Text('Success',
                                    style: TextStyle(
                                        fontFamily: 'maintitle',
                                        color: Color(0xFFe7e7e7),
                                        fontStyle: FontStyle.italic,

                                        //fontWeight: FontWeight.bold,
                                        fontSize: 50.0)),
                                SizedBox(width: 10.0),
                                Text('Road',
                                    style: TextStyle(
                                        fontFamily: 'maintitle',
                                        color: Color(0xFFe7e7e7),
                                        fontStyle: FontStyle.italic,
                                        fontSize: 50.0)),
                              ],
                            ),
                          )),
                    ],
                  ),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0a2f52),
                      Color(0xff2E86C1),
                    ],
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _emailController,
                onChanged: (String value) {},
                cursorColor: Color(0xff1B4F72),
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: Color(0xff1B4F72),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _passwordController,
                onChanged: (String value) {},
                cursorColor: Color(0xff1B4F72),
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Color(0xff1B4F72),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(0xff1B4F72),
                ),
                child: FlatButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: _onPressed,
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FlatButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed("/ForgetPassword"),
                child: Text(
                  "FORGOT PASSWORD ?",
                  style: TextStyle(
                      color: Color(0xff1B4F72),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don't have an Account ? ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/signup");
                },
                child: Text("Sign UP",
                    style: TextStyle(
                        color: Color(0xff1B4F72),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _snackbar() {
    SnackBar(
      elevation: 6.0,
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 500),
        content: Row(
          children: <Widget>[
            Icon(Icons.error),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text("invalid Email or Password"),
            )
          ],
        ));
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
/*  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff2C90A5),

      //ده علشان اخلي الشريط بتاع الاشعارات منور ولا مطفي
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
*/
/*
          decoration: BoxDecoration(

            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF337db1),
                Color(0xFF0a2f52),
                Color(0xFF0a2f52),
                Color(0xFF0a2f52),
              ],
              stops: [
                0.1,
                0.3,
                0.5,
                0.7
              ],
            ),
          ),*/
/*
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0)),

              //Container which Contains Logo
              Container(
                decoration: BoxDecoration(
                  //color: Color(0xFF337db1),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange)),
                child: Image.asset(
                  "assets/Prlogo.png",
                  height: 150.0,
                  width: 150.0,
                ),
              ),
              SizedBox(height: 9.0),
              //Row which Contains App Name
              Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Text('Success',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF0a2f52),
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0)),
                        SizedBox(width: 10.0),
                        Text('Road',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF0a2f52),
                                fontSize: 25.0))
                      ],
                    ),
                  )),
              SizedBox(height: 15.0),

              //Container which Controls data in page
              Container(
                //Controlling the white place Shape
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 258.0,
                decoration: BoxDecoration(
                  color: Color(0xffE5E8E8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                    // bottomRight: Radius.circular(120.0),
                    // bottomLeft: Radius.circular(100.0),
                    //topRight: Radius.circular(100.0)
                  ),
                ),
                padding: EdgeInsets.all(30.0),

                //Stack That Controlling Data In Container
                child: Stack(
                  //primary: false,
                  //padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          // Padding(padding: EdgeInsets.only(top: 2.0)),
                          _buildEmailTF(),
                          SizedBox(
                            height: 20.0,
                          ),
                          _buildPassowrd(),
                          SizedBox(
                            height: 5.0,
                          ),
                          _buildLoginBtn(),
                          SizedBox(
                            height: 5.0,
                          ),
                          _buildForgetPass(),
                          _buildSignUp(),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    //امشي من البدايه علي الشمال لحد طول الكونتينر ونقص من طوله 50
    //ده كدا خط مستقيم علي الشمال
    path.lineTo(0.0, size.height - 50);
//دلوقتي انا واقف علي الشمال عن طول الكونتينر - 50 وهعمل حاجتين
    // وهتحر من نقطتي الي نقطه الموجه الي هيا كنترول بوينت وهتجرك بعدين للاند بوينت الي هيا في نص الموجه لما تزل

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
