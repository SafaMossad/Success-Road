import 'addjob.dart';
import 'manageidea.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

import '../UI/login_page.dart';
import 'managejob.dart';

class AddIdea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddIdeaState();
  }
}

class AddIdeaState extends State<AddIdea> {
  @override
  //ده الي هيتحطلي من البدايه

  Widget _ideaTitle() {
    return Container(
      // alignment: Alignment.topCenter,
      // padding: EdgeInsets.only(bottom:10.0),
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 165.0,
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
            Icons.title,
            color: Color(0xFF8b8b8b),
          ),
          // labelText: "First Name",
          // labelStyle: kLabelStyle,
          hintText: 'Idea Title',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _ideaCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 165.0,
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
            Icons.category,
            color: Color(0xFF8b8b8b),
          ),
          //labelText: "Last Name",
          //labelStyle: kLabelStyle,
          hintText: 'Idea Category',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _funding() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 150.0,
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Color(0xFF0a2f52),
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.attach_money,
            color: Color(0xFF8b8b8b),
          ),
          //labelText: "E-mail",
          //labelStyle: kLabelStyle,
          hintText: "Funding",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _managementType() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 150.0,
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
            Icons.merge_type,
            color: Color(0xFF8b8b8b),
          ),
          //labelText: "Password",
          //labelStyle: kLabelStyle,
          hintText: "Management Type",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _address() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 150.0,
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
            Icons.add_location,
            color: Color(0xFF8b8b8b),
          ),
          // labelText: "Phone",
          // labelStyle: kLabelStyle,
          hintText: "Address",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _ideaDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 150.0,
      //width: MediaQuery.of(context).size.width,
      child: TextField(
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          color: Color(0xFF0a2f52),
          fontFamily: 'OpenSans',
        ),
        maxLines: 20,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.description,
            color: Color(0xFF8b8b8b),
          ),
          //labelText: "Address",
          //labelStyle: kLabelStyle,
          hintText: "Idea Description",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

//  Widget _buildLoginBtn() {
//    return Container(
//      padding: EdgeInsets.symmetric(vertical: 25.0),
//      width: 150.0,
//      child: RaisedButton(
//        elevation: 20.0,
//        onPressed: () => print('Login Button Pressed'),
//        padding: EdgeInsets.all(15.0),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(30.0),
//        ),
//        color: Color(0xFF0a2f52),
//        child: Text(
//          'Upload Files',
//          style: TextStyle(
//            color: Colors.white,
//            letterSpacing: 1.5,
//            fontSize: 18.0,
//            fontWeight: FontWeight.bold,
//            fontFamily: 'OpenSans',
//          ),
//        ),
//      ),
//    );
//  }

  Widget _buildLoginBtns() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF0a2f52),
        child: Text(
          'Add Idea',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // yellow backgroundColor: Color(0xffF7DC6F),
        backgroundColor: Color(0xffEC7063),
        body: ListView(
          padding: EdgeInsets.only(top: 0.0),
          //padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 150.0),
                  child: ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      padding: EdgeInsets.only(),
                      width: double.infinity,
                      height: 588,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff5DADE2),
                          Color(0xffF2F3F4),
                        ],
                      )),
                    ),
                  ),
                ),
                /*  Container(
               padding: EdgeInsets.only(top: 450),
               child:  ClipPath(
                 clipper: WaveClipper3(),
                 child: Container(

                   width: double.infinity,
                   height: 350,
                   decoration: BoxDecoration(
                       gradient: LinearGradient(colors: [
                         Color(0xffF1C40F),
                         Color(0xffF1C40F),
                         Color(0xffF1C40F),
                         Color(0xff85C1E9)
                       ])),
                 ),
               ),
             ),*/
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
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
                Stack(
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
                  children: <Widget>[
                    SingleChildScrollView(
                      //padding: EdgeInsets.only(top: 0.0),

                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //Padding(padding: EdgeInsets.all(10.0)),
                          Container(
                            //Controlling the white place Shape
                            height: 755.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(75.0),
                                bottomRight: Radius.circular(75.0),
                                // bottomLeft: Radius.circular(75.0),
                                //   topRight: Radius.circular(75.0)
                              ),
                            ),
                            padding: EdgeInsets.all(20.0),

                            //Stack That Controlling Data In Container
                            child: Stack(
                              //primary: false,
                              //padding: EdgeInsets.only(left: 25.0, right: 20.0),
                              children: <Widget>[
                                ListView(
                                  children: <Widget>[
                                    Container(

                                      height:
                                      MediaQuery.of(context).size.height-140 ,
                                      padding: EdgeInsets.only(top: 30.0),
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: <Widget>[
                                          // Padding(padding: EdgeInsets.only(top: 2.0)),

//                                        Row(
//                                          children: <Widget>[
//                                            _ideaTitle(),
//                                            SizedBox(
//                                              width: 10.0,
//                                            ),
//                                            _ideaCategory(),
//                                          ],
//                                        ),

                                          _ideaTitle(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _ideaCategory(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _funding(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _managementType(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _address(),

                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          _ideaDescription(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
//                                              _buildLoginBtn(),
//                                              SizedBox(
//                                                width: 20,
//                                              ),
                                              _buildLoginBtns(),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        /*drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 290.0,
                alignment: Alignment.center,
                color: Color(0xFF0a2f52),
                //color:Color(0xffEC7063),
                //color: Colors.deepPurpleAccent,
                child: DrawerHeader(
                  //padding: EdgeInsets.only(top: 0),
                  //margin: EdgeInsets.only(left:  2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF0a2f52)),
                    image: DecorationImage(
                      image: AssetImage("image/logo.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),

//                  child: Text(
////                  "Main",
////                  style: TextStyle(fontSize: 30, color: Colors.white),
////                ),
                ),

                // ),
              ),
              Expanded(
                //flex: 1,
                child: ListView(children: [
                  Container(
                      color: Colors.white,
                      height: 500,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Dashboard",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.dashboard,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Add A New Job",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.add,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddJobs()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Add A New Idea",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.add,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Manage Jobs",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.business_center,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManageJob()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Manage Idea",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.edit_attributes,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManageIdea()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF0a2f52),
                              ),
                            ),
                            trailing: Icon(
                              Icons.edit,
                              color: Color(0xFF0a2f52),
                              size: 25,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),

                          FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLoginPage()),
                              );
                            },
                            tooltip: "Sign Out",
                            child: Icon(
                              Icons.call_missed,
                              size: 55.0,
                            ),
                            backgroundColor: Color(0xFF0a2f52),
                            //focusColor: Colors.pinkAccent,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          // Padding(padding: EdgeInsets.only(top: 10.0,right: 100.0)),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xFF337db1),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          )
                        ],
                      ))
                ]),
              ),
            ],
          ),
        )*/);
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    //امشي من البدايه علي الشمال لحد طول الكونتينر ونقص من طوله 50
    //ده كدا خط مستقيم علي الشمال
    path.lineTo(0.0, size.height);
//دلوقتي انا واقف علي الشمال عن طول الكونتينر - 50 وهعمل حاجتين
    // وهتحر من نقطتي الي نقطه الموجه الي هيا كنترول بوينت وهتجرك بعدين للاند بوينت الي هيا في نص الموجه لما تزل

    var firstEndPoint = Offset(size.width / 2 - 20, size.height - 60);

    var firstControlPoint = Offset(size.width / 2 - 150, size.height - 60);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(
        size.width, //كدا معناها ان كمل بقي خلاص لحد اخر العرض
        size.height / 2); //كده معناه ان الطول نقص منه 2

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

/*class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height/2+30);

    var firstEndPoint = Offset(size.width/2-20, size.height /2+10);
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
}*/

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width / 2 - 20, size.height);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 200);
    var secondControlPoint = Offset(size.width / 2 - 20, size.height - 120);
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
