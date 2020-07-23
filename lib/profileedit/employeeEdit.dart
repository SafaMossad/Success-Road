import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/profiles/emmployeeprofile.dart';
import 'package:successroad/utilities/constants.dart';

class EmployeeEditData extends StatefulWidget {
  Map map;

//  int index=1;

  EmployeeEditData(this.map);

  @override
  EditDataState createState() => EditDataState();
}

class EditDataState extends State<EmployeeEditData> {
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

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _jobtybeController = new TextEditingController();
  TextEditingController _jobcategoryController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _salaryController = new TextEditingController();

  // TextEditingController _genderController = new TextEditingController();
  TextEditingController _qualifcationController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _degreeController = new TextEditingController();
  TextEditingController _indestryController = new TextEditingController();
  TextEditingController _exprenseController = new TextEditingController();
  TextEditingController _employeeBioController = new TextEditingController();
  TextEditingController _datefromController = new TextEditingController();
  TextEditingController _datetoController = new TextEditingController();

  Widget _firstname() {
    return Container(
      /*alignment: Alignment.topCenter,
      padding: EdgeInsets.only(bottom:10.0),*/
      decoration: kBoxDecorationStyle,
      height: 50.0,
      // width: 165.0,
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
          labelText: "Full  Name",
          labelStyle: kLabelStyle,
          hintText: '    ie: x x x',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

/*
  Widget _lastname() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      width: 165.0,
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
            Icons.person,
            color: Color(0xFF8b8b8b),
          ),
          //labelText: "Last Name",
          //labelStyle: kLabelStyle,
          hintText: 'Last Name',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
*/

  Widget _jobtybe() {
    return Container(
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _jobtybeController,
        keyboardType: TextInputType.emailAddress,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.merge_type,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Job Tybe",
          labelStyle: kLabelStyle,
          hintText: "Job Tybe",
          hintStyle: kHintTextStyle,
        ),
      ),
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
        keyboardType: TextInputType.emailAddress,
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
        keyboardType: TextInputType.emailAddress,
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
        keyboardType: TextInputType.emailAddress,
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
      alignment: Alignment.topCenter,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      // width: 150.0,
      child: TextField(
        controller: _degreeController,
        keyboardType: TextInputType.emailAddress,
        style: textColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 7.0),
          prefixIcon: Icon(
            Icons.layers,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Degree",
          labelStyle: kLabelStyle,
          hintText: "ie: Very cood ,Good",
          hintStyle: kHintTextStyle,
        ),
      ),
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
        keyboardType: TextInputType.emailAddress,
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
        keyboardType: TextInputType.emailAddress,
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
          hintText: "Experince",
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
          labelText: "Data to :",
          labelStyle: kLabelStyle,
          hintText: "ie: 2018",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  /*Widget _buildEditEmpBtnsSave() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      //width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: () {
          databaseHelper.editEmployeeData(
              _nameController.text.trim(),
              _jobtybeController.text.trim(),
              _jobcategoryController.text.trim(),
              _addressController.text.trim(),
              _salaryController.text.trim(),
              _genderDropdownValue.trim(),
              _qualifcationController.text.trim(),
              _mobileController.text.trim(),
              _degreeController.text.trim(),
              _indestryController.text.trim(),
              _exprenseController.text.trim());
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new EmployeeProfile(),
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
  }*/

  /*Widget _buildEditEmpBtnsBack() {
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
    _jobtybeController = new TextEditingController(text: widget.map['jobtybe']);
    _jobcategoryController =
        new TextEditingController(text: widget.map['jobcategory']);
    _addressController = new TextEditingController(text: widget.map['address']);
    _salaryController = new TextEditingController(text: widget.map['salary']);
    _qualifcationController =
        new TextEditingController(text: widget.map["Qualifcation"]);
    _mobileController = new TextEditingController(text: widget.map['mobile']);
    _degreeController = new TextEditingController(text: widget.map["Degree"]);
    _indestryController =
        new TextEditingController(text: widget.map['Indestry']);
    _exprenseController =
        new TextEditingController(text: widget.map['Exprense'].toString());
    //_genderController = new TextEditingController(text: widget.map['employeeBio']);

    _employeeBioController =
        new TextEditingController(text: widget.map['employeeBio']);
    _datefromController =
        new TextEditingController(text: widget.map['Datafrom']);
    _datetoController = new TextEditingController(text: widget.map['Datato']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
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
                databaseHelper.editEmployeeData(
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
                  _datefromController.text.trim(),
                  _datetoController.text.trim(),
                );
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new EmployeeProfile(),
                ));
                print("Save");
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
        body:

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
                            height: 660.0,
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
                                      height: MediaQuery.of(context).size.height-145,
                                      padding: EdgeInsets.only(top: 30.0),
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: <Widget>[
                                          // Padding(padding: EdgeInsets.only(top: 2.0)),


                                          _firstname(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _jobtybe(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _jobcategory(),

                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          _address(),


                                          SizedBox(
                                            height: 20.0,
                                          ),

                          _salary(),

                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          _gender(),

                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          _qualification(),

                                          SizedBox(
                                            height: 20.0,
                                          ),


                                          _phone(),

                                          SizedBox(
                                            height: 20.0,
                                          ),


                                         _degree(),

                                          SizedBox(
                                            height: 20.0,
                                          ),


                                          _inndestory(),

                                          SizedBox(
                                            height: 20.0,
                                          ),



                                          _experince(),

                                          SizedBox(
                                            height: 20.0,
                                          ),






                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              _buildEditEmpBtnsSave(),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              _buildEditEmpBtnsBack(),
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

            new Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            // children: <Widget>[
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Personal information",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            _firstname(),

                            Divider(),

                            _degree(),

                            Divider(),

                            _address(),

                            Divider(),

                            _gender(),

                            Divider(),

                            _phone(),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.0),

//user info from regestration

                      Container(
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Field Information",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),

                            Divider(),

                            _jobtybe(),

                            Divider(),


                            _jobcategory(),

                            Divider(),

                            _salary(),

                            Divider(),

                            _qualification(),

                            Divider(),

                            _inndestory(),

                            Divider(),

                            _experince(),

                            Divider(),

                            _employeeBio(),

                            Divider(),

                            _datefrom(),

                            Divider(),

                            _dateto(),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),

                      /*  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildEditEmpBtnsSave(),
                          SizedBox(width: 20.0),
                          _buildEditEmpBtnsBack(),
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

//        ListView(
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
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
//                                      height:
//                                          MediaQuery.of(context).size.height +
//                                              170,
//                                      padding: EdgeInsets.only(top: 30.0),
//                                      alignment: Alignment.topCenter,
//                                      child: Column(
//                                        children: <Widget>[
//                                          // Padding(padding: EdgeInsets.only(top: 2.0)),
//
//                                          Row(
//                                            children: <Widget>[
//                                              _firstname(),
//                                            ],
//                                          ),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _jobtybe(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _jobcategory(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _address(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _salary(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _gender(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _qualification(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _phone(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _degree(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//                                          _inndestory(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _experince(),
//
//                                          Divider(
//                                            thickness: 1.0,
//                                            color: Colors.black,
//                                          ),
//
//                                          _buildEditEmpBtns(),
//
//                                          SizedBox(
//                                            height: 20.0,
//                                          ),
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
