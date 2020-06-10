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
  DatabaseHelper databaseHelper = new DatabaseHelper();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _AddressController = new TextEditingController();
  TextEditingController _CatagoryController = new TextEditingController();
  TextEditingController _GanderController = new TextEditingController();
  TextEditingController _FundingController = new TextEditingController();
  TextEditingController _TypemanagmentController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  Widget _name() {
    return Container(
      // alignment: Alignment.topCenter,
      // padding: EdgeInsets.only(bottom:10.0),
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 165.0,
      child: TextField(
        controller: _nameController,
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
          hintText: 'Name',
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
      //width: 165.0,
      child: TextField(
        controller: _AddressController,
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
          hintText: 'Address',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _catagory() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 150.0,
      child: TextField(
        controller: _CatagoryController,
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
          hintText: "Category",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }


  Widget _gender() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 150.0,
      child: TextField(
        controller: _GanderController,
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
          hintText: "Gander",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }


  Widget _funding() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 150.0,
      //width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: _FundingController,
        keyboardType: TextInputType.number,
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
          hintText: "Funding",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
  Widget _Typemanagment() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 150.0,
      child: TextField(
        controller: _TypemanagmentController,
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

  Widget _phone() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 150.0,
      child: TextField(
        controller: _phoneController,
        keyboardType: TextInputType.number,
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
          hintText: "phone",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _buildSponsorBtnsSave() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      //width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: ()
        {

          databaseHelper.editSponsorData(
              _nameController.text.trim(),
              _AddressController.text.trim(),
              _CatagoryController.text.trim(),
              _GanderController.text.trim(),
              _FundingController.text.trim(),
              _TypemanagmentController.text.trim(),
              _phoneController.text.trim());
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
  }
  Widget _buildSponsorBtnsBack() {
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
  }


  @override
  void initState() {
    _nameController = new TextEditingController(text: widget.map['name']);
    _AddressController = new TextEditingController(text: widget.map['Address']);
    _CatagoryController = new TextEditingController(text: widget.map['Catagory']);
    _GanderController = new TextEditingController(text: widget.map['Gander']);
    _FundingController = new TextEditingController(text: widget.map['Funding']);
    _TypemanagmentController = new TextEditingController(text: widget.map['Typemanagment']);
    _phoneController = new TextEditingController(text: widget.map['phone']);
  }

  @override
  Widget build(BuildContext context) {
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

