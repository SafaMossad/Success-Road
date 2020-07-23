import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/profiles/ideamakerprofile.dart';
import 'package:successroad/utilities/constants.dart';

class IdeaMakerEditData extends StatefulWidget {
  Map map;

  IdeaMakerEditData(this.map);

  @override
  EditDataState createState() => EditDataState();
}

class EditDataState extends State<IdeaMakerEditData> {
//gender controlling
  String genderDropdownValue = 'male';

  // To show Selected Item in Text.
  String genderHolder = '';

  List<String> genderItems = [
    'male',
    'female',
    'not prefer',
  ];

  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController _nameController = new TextEditingController();

  TextEditingController _addreeController = new TextEditingController();
  TextEditingController _websiteController = new TextEditingController();

  //TextEditingController _GanderController = new TextEditingController();
  TextEditingController _qualifictionController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _ideamakerBioController = new TextEditingController();
  TextEditingController _interstingfieldController =
      new TextEditingController();
  TextEditingController _sizeController = new TextEditingController();

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
        keyboardType: TextInputType.emailAddress,
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
        keyboardType: TextInputType.emailAddress,
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
            Text("Gender:",
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
        keyboardType: TextInputType.emailAddress,
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
        keyboardType: TextInputType.emailAddress,
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
        keyboardType: TextInputType.emailAddress,
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

/*
  Widget _gender() {
    return Container(
      padding: EdgeInsets.only(left: 11.0),
      alignment: Alignment.centerLeft,

      decoration: kBoxDecorationStyle,
      height: 63.0,
      child: DropdownButtonFormField(

        hint: Text("hello",style: TextStyle(color: Colors.white),),
        value: _selectedGender,
        items: _dropdownMenuItem,
        onChanged: onChanging1,
        decoration: new InputDecoration(
          icon: Icon(Icons.supervisor_account),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none),),

          contentPadding: EdgeInsets.only(left:7.0,top: 15.0,right: 10.0),

          // hoverColor: Colors.orange,
          // enabledBorder: OutlineInputBorder(gapPadding: 21.0),
          hintText: 'Gender',
          focusColor: Colors.orange,
          labelStyle: TextStyle(color: Colors.white,fontSize: 20),
          labelText: "Gender",
          // labelStyle: ,
          //  hintStyle: kHintTextStyle,
          //icon: new Icon(Icons.person)
        ),
      ),
    );
  }
*/

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

  /* Widget _buildIMBtns() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      //width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: () {
          databaseHelper.editIdeaMakerData(
              _nameController.text.trim(),
              _jobtitleController.text.trim(),
              _addreeController.text.trim(),
              _locationController.text.trim(),
              _GanderController.text.trim(),
              _qualifictionController.text.trim(),
              _mobileController.text.trim(),
              _interstingfieldController.text.trim(),
              _indestryController.text.trim());
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new IdeaMakerProfile(),
          ));
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

  Widget _buildIMBtnsBack() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      //width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: () {
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
    _addreeController = new TextEditingController(text: widget.map['addree']);
    _qualifictionController = new TextEditingController(text: widget.map['qualifiction']);
    _mobileController = new TextEditingController(text: widget.map['mobile']);
    _interstingfieldController = new TextEditingController(text: widget.map["interstingfield"]);
    _ideamakerBioController = new TextEditingController(text: widget.map["ideamakerBio"]);

    _websiteController = new TextEditingController(text: widget.map["Website"]);
    //  _GanderController = new TextEditingController(text: widget.map['Gander']);


    _sizeController = new TextEditingController(text: widget.map["size"].toString());
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
              Icons.arrow_back, // add custom icons also
            ),
          ),
          actions: <Widget>[
            FlatButton(
              //elevation: 20.0,

              onPressed: () {
                databaseHelper.editIdeaMakerData(
                    _nameController.text.trim(),
                    _ideamakerBioController.text.trim(),
                    _addreeController.text.trim(),
                    _websiteController.text.trim(),
                    // _GanderController.text.trim(),
                    genderDropdownValue.trim(),
                    _qualifictionController.text.trim(),
                    _mobileController.text.trim(),
                    _interstingfieldController.text.trim(),
                    _sizeController.text.trim());
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new IdeaMakerProfile(),
                ));
                print("Edit");
              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              //color: Color(0xFF0a2f52),
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
          padding: const EdgeInsets.all(10.0),
          height: 900,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            //padding: const EdgeInsets.all(10.0),
            // children: <Widget>[
            child: Stack(
              children: <Widget>[
                Container(
                  height: 1100,
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
                            Divider(),
                            _name(),
                            Divider(),
                            _address(),

                            Divider(),
                            // _Gander(),
                            _gender(),
                            Divider(),
                            _phone(),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),

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
                                "Field Information",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),

                            _website(),
                            Divider(),
                            _size(),
                            Divider(),
                            _ideamakerBio(),
                            Divider(),
                            _interstingfield(),
                            Divider(),
                            _qualification(),
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
  }
}
