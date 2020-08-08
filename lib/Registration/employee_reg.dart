import 'package:flutter/material.dart';
import 'package:successroad/UI/login_page.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/timeline/choocenavigationEmployee.dart';

import '../utilities/constants.dart';



class Employee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Employee();
  }
}

class Gender {
  String gender;

  Gender(this.gender);

  static List<Gender> getGender() {
    return <Gender>[Gender("MAle"), Gender("Female"), Gender("Not prefer")];
  }
}


class _Employee extends State<Employee> {
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



  String jobtybeDropdownValue = 'Full-Time';

  // To show Selected Item in Text.
  String jobtybeHolder = '';

  List<String> jobtybeItems = [
    'Full-Time',
    'Part-Time',
  ];

  void getDropDownItemjobtybe() {
    setState(() {
      jobtybeHolder = genderDropdownValue;
    });
  }

  String degreeDropdownValue = 'very good';

  // To show Selected Item in Text.
  String degreeHolder = '';

  List<String> degreeItems = [
    'Excellence',
    'very good',
    "good",
    "acceptable "
  ];

  void getDropDownItemdegree() {
    setState(() {
      degreeHolder = degreeDropdownValue;
    });
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _jobtybeController = new TextEditingController();
  final TextEditingController _jobcategoryController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _salaryController = new TextEditingController();
//  final TextEditingController _ganderController = new TextEditingController();
  final TextEditingController _qualifcationController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _degreeController = new TextEditingController();
  final TextEditingController _indestryController = new TextEditingController();
  final TextEditingController _exprenseController = new TextEditingController();
  final TextEditingController _employeeBioController = new TextEditingController();
  final TextEditingController _datefromController = new TextEditingController();
  final TextEditingController _datetoController = new TextEditingController();

  Widget _firstname() {
    return Container(
      /*alignment: Alignment.topCenter,
      padding: EdgeInsets.only(bottom:10.0),*/
      decoration: kBoxDecorationStyle,
      height: 50.0,
     // width: 165.0,
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
          labelText: "Full  Name",
         labelStyle: kLabelStyle,
          hintText: '    ie: x x x',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }


  Widget _jobtybe() {
    return Container(

      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      padding: EdgeInsets.only(left: 10.0),
      // width: 150.0,
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.merge_type,color: Color(0xFF8b8b8b),),
            SizedBox(
              width: 15.0,
            ),
            Text(
                "Job-Tybe", style: TextStyle( color: Color(0xFF8b8b8b),
                fontSize: 15.0,

                fontFamily: 'co',
                fontWeight: FontWeight.w200)
            ),
            SizedBox(
              width: 90.0,
            ),
            Container(
              width: 120.0,
              child: DropdownButton<String>(

                value: jobtybeDropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                ),
                iconSize: 18,
                elevation: 16,
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'co',
                    fontSize: 20.0
                ),

                onChanged: (String data) {
                  setState(() {
                    jobtybeDropdownValue = data;
                  });
                },
                items:
                jobtybeItems.map<DropdownMenuItem<String>>((String value) {
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

  Widget _jobcategory() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _jobcategoryController,
        keyboardType: TextInputType.text,
        style: textColor,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.category,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Job Category",
          labelStyle: kLabelStyle,
          hintText: "Job Category",
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
        controller: _addressController,
        keyboardType: TextInputType.text,
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
          hintText: "Address",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _salary() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _salaryController,
        keyboardType: TextInputType.number,
        style: textColor,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.monetization_on,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Salary",
          labelStyle: kLabelStyle,
          hintText: "ie: 6,000",
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
            Icon(Icons.merge_type,color: Color(0xFF8b8b8b),),
            SizedBox(
              width: 15.0,
            ),
            Text(
                "Gender", style: TextStyle( color: Color(0xFF8b8b8b),
                fontSize: 15.0,

                fontFamily: 'co',
                fontWeight: FontWeight.w200)
            ),
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
                    fontSize: 20.0
                ),

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

  Widget _qualification() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 120.0,
      child: TextField(
        controller: _qualifcationController,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        style: textColor,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.description,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Qualification",
          labelStyle: kLabelStyle,
          hintText: "Qualification",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _phone() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _mobileController,
        keyboardType: TextInputType.phone,
        style: textColor,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.phone,
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

  Widget _degree() {
    return Container(

      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      padding: EdgeInsets.only(left: 10.0),
      // width: 150.0,
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.check_circle,color: Color(0xFF8b8b8b),),
            SizedBox(
              width: 15.0,
            ),
            Text(
                "Degree", style: TextStyle( color: Color(0xFF8b8b8b),
                fontSize: 15.0,

                fontFamily: 'co',
                fontWeight: FontWeight.w200)
            ),
            SizedBox(
              width: 80.0,
            ),
            Container(
              width: 150.0,
              child: DropdownButton<String>(

                value: degreeDropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                ),
                iconSize: 18,
                elevation: 16,
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'co',
                    fontSize: 20.0
                ),

                onChanged: (String data) {
                  setState(() {
                    degreeDropdownValue = data;
                  });
                },
                items:
                degreeItems.map<DropdownMenuItem<String>>((String value) {
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

  Widget _inndestory() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _indestryController,
        keyboardType: TextInputType.text,
        style: textColor,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.business_center,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Inndestory",
          labelStyle: kLabelStyle,
          hintText: "Inndestory",
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
      child: TextField(
        controller: _exprenseController,
        keyboardType: TextInputType.number,
        style: textColor,
        maxLines: 10,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.format_align_left,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Experince",
          labelStyle: kLabelStyle,
          hintText: "Year of Experience",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _employeeBio() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 120.0,
      child: TextField(
        controller: _employeeBioController,
        maxLines: 10,

        keyboardType: TextInputType.multiline,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.format_align_left,
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

  Widget _datefrom() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        controller: _datefromController,
        keyboardType: TextInputType.datetime,
        style: textColor,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.date_range,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Data from",
          labelStyle: kLabelStyle,
          hintText: "ie: 2016 ",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _dateto() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        controller: _datetoController,
        keyboardType: TextInputType.datetime,
        style: textColor,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.date_range,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Data to ",
         labelStyle: kLabelStyle,
          hintText: "ie: 2018",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

/*  Widget _buildSave() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 200.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          databaseHelper.employeeRegister(
              _nameController.text.trim(),
              _jobtybeController.text.trim(),
              _jobcategoryController.text.trim(),
              _addressController.text.trim(),
              _salaryController.text.trim(),
              genderDropdownValue.trim(),
              _qualifcationController.text.trim(),
              _mobileController.text.trim(),
              _degreeController.text.trim(),
              _indestryController.text.trim(),
              _exprenseController.text.trim(),
              _employeeBioController.text.trim(),
              _datetoController.text.trim(),
              _datefromController.text.trim(),




          );

          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new MyLoginPage(),
          ));
          print("Save");
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

      // yellow backgroundColor: Color(0xffF7DC6F),
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


                                        _gender(),


                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),


                                        _phone(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),




                                        _salary(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),


                                        _degree(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _inndestory(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _jobtybe(),


                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),


                                        _jobcategory(),


                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),



                                        _qualification(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),





                                        _experince(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                       _employeeBio(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),


                                        _dateto(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _datefrom(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),



                                      /*  _buildSave(),*/


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
       if( _nameController.text.trim().toLowerCase().isNotEmpty&&
       jobtybeDropdownValue.trim().toLowerCase().isNotEmpty&&
       _jobcategoryController.text.trim().toLowerCase().isNotEmpty&&
       _addressController.text.trim().toLowerCase().isNotEmpty&&
       _salaryController.text.trim().toLowerCase().isNotEmpty&&
       genderDropdownValue.trim().toLowerCase().isNotEmpty&&
       _qualifcationController.text.trim().toLowerCase().isNotEmpty&&
       _mobileController.text.trim().toLowerCase().isNotEmpty&&
       degreeDropdownValue.trim().toLowerCase().isNotEmpty&&
       _indestryController.text.trim().toLowerCase().isNotEmpty&&
       _exprenseController.text.trim().toLowerCase().isNotEmpty&&
       _employeeBioController.text.trim().toLowerCase().isNotEmpty&&
       _datetoController.text.trim().toLowerCase().isNotEmpty&&
       _datefromController.text.trim().toLowerCase().isNotEmpty)
       {
         databaseHelper.employeeRegister(
           _nameController.text.trim(),
           jobtybeDropdownValue.trim(),
           _jobcategoryController.text.trim(),
           _addressController.text.trim(),
           _salaryController.text.trim(),
           genderDropdownValue.trim(),
           _qualifcationController.text.trim(),
           _mobileController.text.trim(),
           degreeDropdownValue.trim(),
           _indestryController.text.trim(),
           _exprenseController.text.trim(),
           _employeeBioController.text.trim(),
           _datetoController.text.trim(),
           _datefromController.text.trim(),

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
