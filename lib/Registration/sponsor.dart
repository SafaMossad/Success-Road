import 'package:flutter/material.dart';
import 'package:successroad/UI/login_page.dart';
import 'package:successroad/api/databasehelper.dart';

import '../utilities/constants.dart';



class Sponsor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Sponsor();
  }
}
/*
class Gender {
  String gender;

  Gender(this.gender);

  static List<Gender> getGender() {
    return <Gender>[Gender("Male"), Gender("Female"), Gender("Not prefer")];
  }
}
class Manage {
  String man;

  Manage(this.man);

  static List<Manage> getManage() {
    return <Manage>[Manage("fully"), Manage("semi"), Manage("Non")];
  }
}
*/

class _Sponsor extends State<Sponsor> {


//gender controlling
  String genderDropdownValue = 'male';

  // To show Selected Item in Text.
  String genderHolder = '';

  List<String> genderItems = [
    'male',
    'female',
    'not prefer',
  ];

  void getDropDownItemGender() {
    setState(() {
      genderHolder = genderDropdownValue;
    });
  }

  //mangment controlling

  String mangmentdropdownValue = 'fully';

  // To show Selected Item in Text.
  String mangmentholder = '';

  List<String> mangmentItems = [
    'fully',
    'semi',
  ];

  void getDropDownItemanagemangment() {
    setState(() {
      mangmentholder = mangmentdropdownValue;
    });
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _addreeController = new TextEditingController();
  final TextEditingController _categoryController = new TextEditingController();
  final TextEditingController _fundingController = new TextEditingController();

  // final TextEditingController _typemanagmentController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _experinceController = new TextEditingController();
  final TextEditingController _bioController = new TextEditingController();

  Widget _firstname() {
    return Container(
      /* alignment: Alignment.topCenter,
      padding: EdgeInsets.only(bottom:10.0),*/
      decoration: kBoxDecorationStyle,
      height: 60.0,
      //width: 350.0,
      child: TextField(
        controller: _nameController,
        keyboardType: TextInputType.text,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Full Name",
          labelStyle: kLabelStyle,
          hintText: ' ie: X X X',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _address() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _addreeController,
        //keyboardType: TextInputType.,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.location_on,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Address",
          labelStyle: kLabelStyle,
          hintText: "ie: Cairo ,nasr city ",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _categoey() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _categoryController,
        keyboardType: TextInputType.emailAddress,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.category,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "categoey",
          labelStyle: kLabelStyle,
          hintText: "categoey",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _gender() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      padding: EdgeInsets.only(left: 10.0),
      // width: 150.0,
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.merge_type,
              color: Color(0xFF8b8b8b),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text("Gender",
                style: TextStyle(
                    color: Color(0xFF8b8b8b),
                    fontSize: 15.0,
                    fontFamily: 'co',
                    fontWeight: FontWeight.w200)),
            SizedBox(
              width: 90.0,
            ),
            Container(
              width: 120.0,
              child: DropdownButton<String>(
                value: genderDropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                ),
                iconSize: 18,
                elevation: 16,
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'co',
                    fontSize: 20.0),
                onChanged: (String data) {
                  setState(() {
                    genderDropdownValue = data;
                  });
                },
                items:
                    genderItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _funding() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        controller: _fundingController,
        keyboardType: TextInputType.number,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.monetization_on,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Funding",
          labelStyle: kLabelStyle,
          hintText: "ie: 850,000",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _typeofmanagment() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      padding: EdgeInsets.only(left: 10.0),
      // width: 150.0,
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.supervisor_account,
              color: Color(0xFF8b8b8b),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "Mangment",
              style: TextStyle(color: Color(0xFF8b8b8b),),
            ),
            SizedBox(
              width: 70.0,
            ),
            Container(
              width: 80.0,
              child: DropdownButton<String>(
                value: mangmentdropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                ),
                iconSize: 18,
                elevation: 16,
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'co',
                    fontSize: 20.0),
                onChanged: (String data) {
                  setState(() {
                    mangmentdropdownValue = data;
                  });
                },
                items:
                    mangmentItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _Phone() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.phone_forwarded,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Phone",
          labelStyle: kLabelStyle,
          hintText: "ie : 01X XXX XXX XX",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _experince() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 120.0,
      // width: 150.0,
      child: TextField(
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        controller: _experinceController,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.format_list_bulleted,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Experince",
          labelStyle: kLabelStyle,
          hintText: "Experince",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _bio() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 120.0,
      // width: 150.0,
      child: TextField(
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        controller: _bioController,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 2.0),
          prefixIcon: Icon(
            Icons.subject,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Your Bio",
          labelStyle: kLabelStyle,
          hintText: "Bio",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

 /* Widget _build_Save() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 200.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          databaseHelper.sponsorRegister(
            _nameController.text.trim(),
            _addreeController.text.trim(),
            _categoryController.text.trim(),
            genderDropdownValue.trim(),
            _fundingController.text.trim(),
            mangmentdropdownValue.trim(),
            _phoneController.text.trim(),
            _experinceController.text.trim(),
            _bioController.text.trim(),
          );

          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new MyLoginPage(),
          ));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF0a2f52),
        child: Text(
          'Save',
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
  }*/
  final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  showSnackBar(){
    scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text('Please Write All Data!')));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff5DADE2),
      body: ListView(
        padding: EdgeInsets.only(top: 0),
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
                    height: 485,
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

                children: <Widget>[
                  SingleChildScrollView(
                    //padding: EdgeInsets.only(top: 0.0),

                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Padding(padding: EdgeInsets.all(10.0)),

                        Container(
                          //Controlling the white place Shape
                          height: 650.0,
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
                                    padding: EdgeInsets.only(top: 0.0),
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      children: <Widget>[
                                        // Padding(padding: EdgeInsets.only(top: 2.0)),

                                        _firstname(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),



                                        _address(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _Phone(),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _gender(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _funding(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _typeofmanagment(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _categoey(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _experince(),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _bio(),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                       /* _build_Save(),*/
                                        SizedBox(
                                          height: 180.0,
                                        ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            if(
              _nameController.text.trim().toLowerCase().isNotEmpty&&
              _addreeController.text.trim().toLowerCase().isNotEmpty&&
              _categoryController.text.trim().toLowerCase().isNotEmpty&&
              genderDropdownValue.trim().toLowerCase().isNotEmpty&&
              _fundingController.text.trim().toLowerCase().isNotEmpty&&
              mangmentdropdownValue.trim().toLowerCase().isNotEmpty&&
              _phoneController.text.trim().toLowerCase().isNotEmpty&&
              _experinceController.text.trim().toLowerCase().isNotEmpty&&
              _bioController.text.trim().toLowerCase().isNotEmpty
            )
            {
              databaseHelper.sponsorRegister(
                _nameController.text.trim(),
                _addreeController.text.trim(),
                _categoryController.text.trim(),
                genderDropdownValue.trim(),
                _fundingController.text.trim(),
                mangmentdropdownValue.trim(),
                _phoneController.text.trim(),
                _experinceController.text.trim(),
                _bioController.text.trim(),
              );
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new MyLoginPage(),
              ));
              print("Save");
            }
            else{
              showSnackBar();
              print("Please Enter All Data");}

          });
        },
        label: Text(
          'Continue....',
          style: TextStyle(
            color: Colors.grey.shade300,
          ),
        ),
        backgroundColor: Color(0xff1B4F72),
      ),
    );


  }
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('you Cannot Add it to Favorite Again"'),
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
