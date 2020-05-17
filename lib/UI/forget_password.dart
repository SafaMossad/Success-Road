
import 'package:flutter/material.dart';
import 'package:successroad/UI/login_page.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _ForgetPassword();
  }
}

class _ForgetPassword extends State<ForgetPassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // yellow backgroundColor: Color(0xffF7DC6F),
      //backgroundColor: Color(0xffEC7063),
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
//                        Color(0xffF1C40F),
//                        Color(0xffF1C40F),
//                        Color(0xffF1C40F),
//                        Color(0xff85C1E9)

                        Color(0xFF0a2f52),
                        Color(0xff2E86C1),
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
//                        decoration: BoxDecoration(
//                          //color: Color(0xFF337db1),
//                            shape: BoxShape.circle,
//                            border: Border.all(color: Colors.amberAccent)),
                        child: Image.asset(
                          "assets/Prlogo.png",
                          height: 160.0,
                          width: 200.0,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Text('Success',
                                    style: TextStyle(
                                        fontFamily: 'maintitle',
                                        color:Color(0xFFe7e7e7),
                                        //color: Colors.amberAccent,
                                        fontStyle: FontStyle.italic,

                                        //fontWeight: FontWeight.bold,
                                        fontSize: 50.0)),
                                SizedBox(width: 10.0),
                                Text('Road',
                                    style: TextStyle(
                                        fontFamily: 'maintitle',
                                        color:Color(0xFFe7e7e7),
                                        //color: Colors.amberAccent,
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
              elevation: 20.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Color(0xff1B4F72),
                decoration: InputDecoration(
                    hintText: "Current Password",
                    //prefixIcon: Material(
                    //  elevation: 0,
                    //  borderRadius: BorderRadius.all(Radius.circular(30)),
                    //  child: Icon(
                    //    Icons.email,
                    //    color: Color(0xff1B4F72),
                    //  ),
                    //),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 20.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),

            ),
          ),


          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 20.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Color(0xff1B4F72),
                decoration: InputDecoration(
                    hintText: "New Password",
                    //prefixIcon: Material(
                    //  elevation: 0,
                    //  borderRadius: BorderRadius.all(Radius.circular(30)),
                    //  child: Icon(
                    //    Icons.lock,
                    //    color: Color(0xff1B4F72),
                    //  ),
                    //),
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
              elevation: 20.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Color(0xff1B4F72),
                decoration: InputDecoration(
                    hintText: "Confirm New Password",
                    //prefixIcon: Material(
                    //  elevation: 0,
                    //  borderRadius: BorderRadius.all(Radius.circular(30)),
                    //  child: Icon(
                    //    Icons.lock,
                    //    color: Color(0xff1B4F72),
                    //  ),
                    //),
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
                    "Save Change",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage()),
                    );
                  },
                ),
              )),
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
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage()),
                    );
                  },
                ),
              )),

          SizedBox(
            height: 40,
          ),

        ],
      ),
    );
  }

/*  @override
  Widget build(BuildContext context) {

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
