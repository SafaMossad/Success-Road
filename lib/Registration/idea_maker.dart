

import 'package:flutter/material.dart';
import 'package:successroad/UI/login_page.dart';
import 'package:successroad/api/databasehelper.dart';

import '../utilities/constants.dart';

void main() {
  runApp(MaterialApp(
    home: IdeaMaker(),
  ));
}

class IdeaMaker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IdeaMaker();
  }
}

class _IdeaMaker extends State<IdeaMaker> {


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

  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _addreeController = new TextEditingController();
  // final TextEditingController _GanderController  = new TextEditingController();
  final TextEditingController _qualifictionController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _interstingfieldController =new TextEditingController();
  final TextEditingController _ideamakerBioController = new TextEditingController();
  final TextEditingController _websiteController = new TextEditingController();
  final TextEditingController _sizeController = new TextEditingController();
  final TextEditingController _ownernaemController = new TextEditingController();
  final TextEditingController _ownerphonoController = new TextEditingController();
  final TextEditingController _owneraddressController = new TextEditingController();
  final TextEditingController _companyemailController =new TextEditingController();
  Widget _name() {
    return Container(
      // alignment: Alignment.topCenter,
      // padding: EdgeInsets.only(bottom:10.0),
      alignment: Alignment.centerLeft,

      decoration: kBoxDecorationStyle,
      height: 60.0,
      width: 350.0,
      child: TextField(
        controller: _nameController,
        keyboardType: TextInputType.text,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          //contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Full Name",
          labelStyle: kLabelStyle,
          hintText: '    ie: x x x',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _address() {
    return Container(
      alignment: Alignment.topLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _addreeController,
        keyboardType: TextInputType.text,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          // contentPadding: EdgeInsets.only(top: 14.0),
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

  Widget _gender() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 48.0,
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

  Widget _qualification() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 120.0,
      child: TextField(
        // maxLines: 10,
        controller: _qualifictionController,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          // contentPadding: EdgeInsets.only(top: 20.0),
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
          // contentPadding: EdgeInsets.only(top: 14.0),
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

  Widget _interstingfield() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 120.0,
      child: TextField(
        controller: _interstingfieldController,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          //contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.format_list_bulleted,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Intersting Fields",
          labelStyle: kLabelStyle,
          hintText: "Intersting Field",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _ideamakerBio() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 120.0,
      // width: 150.0,
      child: TextField(
        controller: _ideamakerBioController,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          //contentPadding: EdgeInsets.only(top: 14.0),
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

  Widget _website() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        controller: _websiteController,
        keyboardType: TextInputType.emailAddress,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          //contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.mail_outline,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Web Site",
          labelStyle: kLabelStyle,
          hintText: "ie : WWW.AYZ.com",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _size() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        controller: _sizeController,
        keyboardType: TextInputType.number,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          //contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.business,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Company Size",
          labelStyle: kLabelStyle,
          hintText: "Number of Employee ",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
  Widget _companyEmail() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        controller: _companyemailController,
        keyboardType: TextInputType.text,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          //contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.business,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Company E-Mail",
          labelStyle: kLabelStyle,
          hintText: "www.person.com",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _ownernaem() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: TextField(
        controller: _ownernaemController,
        keyboardType: TextInputType.text,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          //contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.business,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Owner Name",
          labelStyle: kLabelStyle,
          hintText: "X X X X",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _ownerphono() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _ownerphonoController,
        keyboardType: TextInputType.phone,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          // contentPadding: EdgeInsets.only(top: 14.0),
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

  Widget _owneraddress() {
    return Container(
      alignment: Alignment.topLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      // width: 150.0,
      child: TextField(
        controller: _owneraddressController,
        //maxLines: 10,
        keyboardType: TextInputType.text,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          // contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.location_on,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Owner Address",
          labelStyle: kLabelStyle,
          hintText: "ie: Cairo ,nasr city ",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

 /* Widget _buildSave() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 200.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          databaseHelper.companyRegister(
              _nameController.text.trim(),
              _addreeController.text.trim(),
              genderDropdownValue.trim(),
              _qualifictionController.text.trim(),
              _mobileController.text.trim(),
              _interstingfieldController.text.trim(),
              _ideamakerBioController.text.trim(),
              _websiteController.text.trim(),
              _sizeController.text.trim(),
              _ownernaemController.text.trim(),
              _ownerphonoController.text.trim(),
              _owneraddressController.text.trim()


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
                    padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
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

                            ),
                          ),
                          padding: EdgeInsets.all(20.0),

                          //Stack That Controlling Data In Container
                          child: Stack(

                            children: <Widget>[
                              ListView(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 0.0),
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      children: <Widget>[
                                        // Padding(padding: EdgeInsets.only(top: 2.0)),
                                        SizedBox(height: 15,),
                                        Container(
                                          child: Center(
                                            child: Text("Company Information",style: TextStyle(
                                                color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 15,),
                                        _name(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _phone(),

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

                                        _website(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _ideamakerBio(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _interstingfield(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _qualification(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),

                                        _size(),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          child: Center(
                                            child: Text("User Information",style: TextStyle(
                                              color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                        SizedBox(height: 15,),

                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _companyEmail(),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _ownernaem(),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _ownerphono(),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        _owneraddress(),
                                        Divider(
                                          thickness: 1.0,
                                          color: Colors.black,
                                        ),
                                        /*_buildSave(),*/

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
          _nameController.text.trim().isNotEmpty&&
          _addreeController.text.trim().isNotEmpty&&
          genderDropdownValue.trim().isNotEmpty&&
          _qualifictionController.text.trim().isNotEmpty&&
          _mobileController.text.trim().isNotEmpty&&
          _interstingfieldController.text.trim().isNotEmpty&&
          _ideamakerBioController.text.trim().isNotEmpty&&
          _sizeController.text.trim().isNotEmpty&&
          _ownernaemController.text.trim().isNotEmpty&&
          _ownerphonoController.text.trim().isNotEmpty&&
          _owneraddressController.text.trim().isNotEmpty)
          {
            databaseHelper.companyRegister(
                _nameController.text.trim(),
                _addreeController.text.trim(),
                genderDropdownValue.trim(),
                _qualifictionController.text.trim(),
                _mobileController.text.trim(),
                _interstingfieldController.text.trim(),
                _ideamakerBioController.text.trim(),
                _websiteController.text.trim(),
                _sizeController.text.trim(),
                _ownernaemController.text.trim(),
                _ownerphonoController.text.trim(),
                _owneraddressController.text.trim(),
              _companyemailController.text.trim()


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
