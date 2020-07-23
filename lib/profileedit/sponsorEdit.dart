import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/profiles/ideamakerprofile.dart';
import 'package:successroad/profiles/sponsorprofile.dart';
import 'package:successroad/utilities/constants.dart';


class SponsorEditData extends StatefulWidget {
  Map map;

  SponsorEditData(this.map);

  @override
  EditDataState createState() => EditDataState();
}

class EditDataState extends State<SponsorEditData> {


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
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _catagoryController = new TextEditingController();
 // TextEditingController _ganderController = new TextEditingController();
  TextEditingController _fundingController = new TextEditingController();
 // TextEditingController _typemanagmentController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _experinceController = new TextEditingController();
  TextEditingController _bioController = new TextEditingController();


  Widget _firstname() {
    return Container(
      /* alignment: Alignment.topCenter,
      padding: EdgeInsets.only(bottom:10.0),*/
      decoration: kBoxDecorationStyle,
      height: 60.0,
      //width: 350.0,
      child: TextField(
        controller: _nameController,
        keyboardType: TextInputType.emailAddress,
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
        controller: _addressController,
        keyboardType: TextInputType.emailAddress,
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
        controller: _catagoryController,
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
                    color: Colors.red,
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
        keyboardType: TextInputType.emailAddress,
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
              style: kHintTextStyle,
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
        keyboardType: TextInputType.number,
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
        controller: _experinceController,
        keyboardType: TextInputType.emailAddress,
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
        controller: _bioController,
        keyboardType: TextInputType.emailAddress,
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



 /* Widget _buildSponsorBtnsSave() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      //width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: ()
        {

          databaseHelper.editSponsorData(
              _nameController.text.trim(),
              _addressController.text.trim(),
              _catagoryController.text.trim(),
              _ganderController.text.trim(),
              _fundingController.text.trim(),
              _typemanagmentController.text.trim(),
              _phoneController.text.trim(),
              _bioController.text.trim(),
              _experinceController.text.trim()
          );

          Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new SponsorProfile(),
              )
          );
          print("Edit");
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



/*  Widget _buildSponsorBtnsBack() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      //width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: ()
        {
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF0a2f52),
        child: Text(
          'Back',
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


  @override
  void initState() {
    _nameController = new TextEditingController(text: widget.map['name']);
    _addressController = new TextEditingController(text: widget.map['Address']);
    _catagoryController = new TextEditingController(text: widget.map['Catagory']);
    //_ganderController = new TextEditingController(text: widget.map['Gander']);
    _fundingController = new TextEditingController(text: widget.map['Funding']);
   // _typemanagmentController = new TextEditingController(text: widget.map['Typemanagment']);
    _phoneController = new TextEditingController(text: widget.map['phone']);
    _experinceController = new TextEditingController(text: widget.map['exprience']);
    _bioController = new TextEditingController(text: widget.map['sponcerBio']);
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Update User Data',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Color(0xff1B4F72),
          title: Text("Edit profile"),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,  // add custom icons also
            ),
          ),
          actions: <Widget>[

            FlatButton(
              //elevation: 20.0,
              onPressed: ()
              {
                databaseHelper.editSponsorData(
                    _nameController.text.trim(),
                    _addressController.text.trim(),
                    _catagoryController.text.trim(),
                    genderDropdownValue.trim(),
                    _fundingController.text.trim(),
                    mangmentdropdownValue.trim(),
                    _phoneController.text.trim(),
                    _bioController.text.trim(),
                    _experinceController.text.trim()
                );
                Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new SponsorProfile(),
                    )
                );
                print("Edit");
              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),

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
          ],
        ),
        body: new Container(
         color: Colors.grey.shade300,
          padding: const EdgeInsets.all(10.0),
          //height: 900,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            //padding: const EdgeInsets.all(10.0),
            // children: <Widget>[
            child: Stack(
              children: <Widget>[
                Container(
                  //height: MediaQuery.of(context).size.height - 170,
                  height: MediaQuery.of(context).size.height+100,
                  margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                  child: Column(
                    children: <Widget>[
                      //user info from regestration
                      Container(
                        //height: 800,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: Text(
                                "Personal information",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            _firstname(),
                            Divider(),
                            _address(),
                            Divider(),
                            _gender(),
                            Divider(),
                            _Phone(),



                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),

                      Container(
                        //height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: Text(
                                "Field Information",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            _funding(),
                            Divider(),
                            _typeofmanagment(),
                            Divider(),
                            _categoey(),
                            Divider(),
                            _experince(),
                            Divider(),
                            _bio(),
                          ],
                        ),
                      ),
                      //SizedBox(height: 20.0),
                      /*    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildIMBtns(),
                          SizedBox(width: 20.0),
                          _buildIMBtnsBack(),
                        ],
                      )*/
                    ],
                  ),
                ),
              ],
            ),
            //],
          ),
        ),

        /*
        ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[

                Stack(
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
                            height: 800.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(75.0),
                                bottomRight: Radius.circular(75.0),

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
                                      height: MediaQuery.of(context).size.height*1.3,
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

                                          _name(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _jobtitle(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _addree(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _location(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _Gander(),

                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          _qualifiction(),

                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          _mobile(),

                                          SizedBox(
                                            height: 20.0,
                                          ),_interstingfield(),

                                          SizedBox(
                                            height: 20.0,
                                          ),_indestry(),

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


*/
      ),
    );





    /*
    return MaterialApp(
      title: 'Edit Sponsor',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1B4F72),
          title: Text("Edit Profile"),
          centerTitle: true,
        ),
        body: new Container(
          child:SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            // children: <Widget>[
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      //user info from regestration
                      Container(
                        //height: 800,
                        decoration: BoxDecoration(
                          color:  Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Column(
                          children: <Widget>[

                            _name(),

                            Divider(
                              thickness: 1.0,
                              color: Color(0xff1B4F72),
                            ),


                            _address(),


                            Divider(
                              thickness: 1.0,
                              color: Color(0xff1B4F72),
                            ),


                            _catagory(),


                            Divider(
                              thickness: 1.0,
                              color: Color(0xff1B4F72),
                            ),


                            _address(),

                            Divider(
                              thickness: 1.0,
                              color: Color(0xff1B4F72),
                            ),

                            _funding(),


                            Divider(
                              thickness: 1.0,
                              color: Color(0xff1B4F72),
                            ),


                            _gender(),


                            Divider(
                              thickness: 1.0,
                              color: Color(0xff1B4F72),
                            ),


                            _Typemanagment(),

                            Divider(
                              thickness: 1.0,
                              color: Color(0xff1B4F72),
                            ),


                            _phone(),



                          ],
                        ),
                      ),
                      //SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildSponsorBtnsSave(),
                          SizedBox(width: 20.0),
                          _buildSponsorBtnsBack(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            //],

          ),


        ),













//        body: ListView(
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
//
//                Stack(
//                  children: <Widget>[
//                    SingleChildScrollView(
//                      //padding: EdgeInsets.only(top: 0.0),
//                      physics: AlwaysScrollableScrollPhysics(),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          //Padding(padding: EdgeInsets.all(10.0)),
//                          Container(
//                            //Controlling the white place Shape
//                            height: 670.0,
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.only(
//                                topLeft: Radius.circular(75.0),
//                                bottomRight: Radius.circular(75.0),
//
//                              ),
//                            ),
//                            padding: EdgeInsets.all(20.0),
//
//                            //Stack That Controlling Data In Container
//                            child: Stack(
//                              //primary: false,
//                              //padding: EdgeInsets.only(left: 25.0, right: 20.0),
//                              children: <Widget>[
//                                ListView(
//                                  children: <Widget>[
//                                    Container(
//                                      height: MediaQuery.of(context).size.height+170,
//                                      padding: EdgeInsets.only(top: 30.0),
//                                      alignment: Alignment.topCenter,
//                                      child: Column(
//                                        children: <Widget>[
//                                          // Padding(padding: EdgeInsets.only(top: 2.0)),
//
////                                        Row(
////                                          children: <Widget>[
////                                            _ideaTitle(),
////                                            SizedBox(
////                                              width: 10.0,
////                                            ),
////                                            _ideaCategory(),
////                                          ],
////                                        ),
//
//                                          _name(),
//
//                                          SizedBox(
//                                            height: 20.0,
//                                          ),
//
//                                          _address(),
//
//                                          SizedBox(
//                                            height: 20.0,
//                                          ),
//
//                                          _catagory(),
//
//                                          SizedBox(
//                                            height: 20.0,
//                                          ),
//
//                                          _gender(),
//                                          SizedBox(
//                                            height: 20.0,
//                                          ),
//                                          _funding(),
//
//                                          SizedBox(
//                                            height: 20.0,
//                                          ),
//
//                                          _Typemanagment(),
//
//                                          SizedBox(
//                                            height: 20.0,
//                                          ),
//                                          _phone(),
//
//                                          Row(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.center,
//                                            children: <Widget>[
////                                              _buildLoginBtn(),
////                                              SizedBox(
////                                                width: 20,
////                                              ),
//                                              _buildLoginBtns(),
//                                            ],
//                                          )
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                )
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ],
//        ),
//











      ),
    );

     */
  }

}


class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    //ÇãÔí ãä ÇáÈÏÇíå Úáí ÇáÔãÇá áÍÏ Øæá ÇáßæäÊíäÑ æäÞÕ ãä Øæáå 50
    //Ïå ßÏÇ ÎØ ãÓÊÞíã Úáí ÇáÔãÇá
    path.lineTo(0.0, size.height);
//ÏáæÞÊí ÇäÇ æÇÞÝ Úáí ÇáÔãÇá Úä Øæá ÇáßæäÊíäÑ - 50 æåÚãá ÍÇÌÊíä
    // æåÊÍÑ ãä äÞØÊí Çáí äÞØå ÇáãæÌå Çáí åíÇ ßäÊÑæá ÈæíäÊ æåÊÌÑß ÈÚÏíä ááÇäÏ ÈæíäÊ Çáí åíÇ Ýí äÕ ÇáãæÌå áãÇ ÊÒá

    var firstEndPoint = Offset(size.width / 2 - 20, size.height - 60);

    var firstControlPoint = Offset(size.width / 2 - 150, size.height - 60);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(
        size.width, //ßÏÇ ãÚäÇåÇ Çä ßãá ÈÞí ÎáÇÕ áÍÏ ÇÎÑ ÇáÚÑÖ
        size.height / 2); //ßÏå ãÚäÇå Çä ÇáØæá äÞÕ ãäå 2

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
}
*/
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

