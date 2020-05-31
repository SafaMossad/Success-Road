//import 'package:final_design/ui/addidea.dart';
//import 'package:jobfinalapi/login_page.dart';


import 'package:flutter/material.dart';
//import 'package:successroad/utilities/constants.dart';
import 'package:successroad/utilities/job_and_idea.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/jobs/dashboard.dart';





class AddJobs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddJobsState();
  }
}




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










class AddJobsState extends State<AddJobs> {
  @override
  //ده الي هيتحطلي من البدايه
  List<Gender> _get_Gender = Gender.getGender();
  List<DropdownMenuItem<Gender>> _DropdownMenuItem;
  Gender _Selected_Gender;

  List<Manage> _get_Manage = Manage.getManage();
  List<DropdownMenuItem<Manage>> _DropdownMenuItem_Manage;
  Manage _Selected_Manage;

  DatabaseHelper databaseHelper = new DatabaseHelper();

  final TextEditingController _jobTitleController =
  new TextEditingController();
  final TextEditingController _jobTypeController =
  new TextEditingController();
  final TextEditingController _jobCategoryController = new TextEditingController();
  final TextEditingController _addressController =
  new TextEditingController();
  final TextEditingController _salaryController = new TextEditingController();
  final TextEditingController _genderController = new TextEditingController();
  final TextEditingController _countryController = new TextEditingController();
  final TextEditingController _cityController = new TextEditingController();
  final TextEditingController _qualificationController = new TextEditingController();
  final TextEditingController _experienceController = new TextEditingController();
  final TextEditingController _jobDescriptionController = new TextEditingController();


  @override
  //ده الي هيتحطلي من البدايه
  void initState() {
    _DropdownMenuItem =
        buildDropdownMenuIte(_get_Gender).cast<DropdownMenuItem<Gender>>();

    _Selected_Gender = _DropdownMenuItem[0].value;

    _DropdownMenuItem_Manage =
        buildDropdownMenuItem(_get_Manage).cast<DropdownMenuItem<Manage>>();
    _Selected_Manage = _DropdownMenuItem_Manage[0].value;
  }

  //
  List<DropdownMenuItem<Gender>> buildDropdownMenuIte(List _Clicked_Gender) {
    List<DropdownMenuItem<Gender>> item = List();

    for (Gender x in _Clicked_Gender) {
      item.add(DropdownMenuItem(
        value: x,
        child: Text(x.gender),
      ));
    }
    return item;
  }

  List<DropdownMenuItem<Manage>> buildDropdownMenuItem(List _Clicked_Manage) {
    List<DropdownMenuItem<Manage>> manage = List();

    for (Manage m in _Clicked_Manage) {
      manage.add(DropdownMenuItem(
        value: m,
        child: Text(m.man),
      ));
    }
    return manage;
  }

  onChanging1(Gender selected) {
    setState(() {
      _Selected_Gender = selected;
    });
  }

  onChanging2(Manage select) {
    setState(() {
      _Selected_Manage = select;
    });
  }

  Widget _jobTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _jobTitleController,
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
//          labelText: "Job Title",
//          labelStyle: kLabelStyle,
          hintText: 'Job Title',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
  Widget _jobType() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _jobTypeController,
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
//          labelText: "Job Type",
//          labelStyle: kLabelStyle,
          hintText: 'Job Type',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
  Widget _jobCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _jobCategoryController,
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
//          labelText: "Job Category",
//          labelStyle: kLabelStyle,
          hintText: 'Job Category',
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
      //width: 140.0,
      child: TextField(
        controller: _addressController,
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
//          labelText: "Address",
//          labelStyle: kLabelStyle,
          hintText: 'Address',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }


  Widget _salary() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _salaryController,
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
//          labelText: "Salary",
//          labelStyle: kLabelStyle,
          hintText: 'Salary',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }




  //gender not have controller
  Widget _gender() {
    return DropdownButtonFormField(
      hint: Text("hello"),
      value: _Selected_Gender,
      items: _DropdownMenuItem,
      onChanged: onChanging1,
//      style: TextStyle(
//        //backgroundColor: Colors.deepPurpleAccent,
//        color: Colors.white,
//      ),
      decoration: new InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              width: 2.0,
            )
        ),
        //hoverColor: Colors.orange,
        enabledBorder: OutlineInputBorder(
            gapPadding: 21.0, borderRadius: BorderRadius.circular(30.0)
        ),
        hintText: 'Gender',
        //focusColor: Colors.orange,
        labelText: "Gender",
        // labelStyle: ,
        hintStyle: kHintTextStyle,
        //icon: new Icon(Icons.person)
      ),
    );
  }



  Widget _country() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _countryController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Color(0xFF0a2f52),
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.location_city,
            color: Color(0xFF8b8b8b),
          ),
//          labelText: "Country",
//          labelStyle: kLabelStyle,
          hintText: 'Country',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }


  Widget _city() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _cityController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Color(0xFF0a2f52),
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.location_city,
            color: Color(0xFF8b8b8b),
          ),
//          labelText: "City",
//          labelStyle: kLabelStyle,
          hintText: 'City',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }


  Widget _qualification() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _qualificationController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Color(0xFF0a2f52),
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.question_answer,
            color: Color(0xFF8b8b8b),
          ),
//          labelText: "Qualification",
//          labelStyle: kLabelStyle,
          hintText: 'Qualification',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }



  Widget _experience() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 50.0,
      //width: 140.0,
      child: TextField(
        controller: _experienceController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Color(0xFF0a2f52),
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.explicit,
            color: Color(0xFF8b8b8b),
          ),
//          labelText: "Experience",
//          labelStyle: kLabelStyle,
          hintText: 'Experience',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
  Widget _jobDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 150.0,
      //width: 200.0,
      child: TextField(
        controller: _jobDescriptionController,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          color: Color(0xFF0a2f52),
          fontFamily: 'OpenSans',
        ),
        maxLines: 10,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.description,
            color: Color(0xFF8b8b8b),
          ),
//          labelText: "Idea Description",
//          labelStyle: kLabelStyle,
          hintText: 'Job Description',
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
        onPressed: () {
          databaseHelper.addDataJobs(
              _jobTitleController.text.trim(),
              _jobTypeController.text.trim(),
              _jobCategoryController.text.trim(),
              _addressController.text.trim(),
              _salaryController.text.trim(),
              _genderController.text.trim(),
              _countryController.text.trim(),
              _cityController.text.trim(),
              _qualificationController.text.trim(),
              _experienceController.text.trim(),
              _jobDescriptionController.text.trim());
          Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Dashboard(),
              )
          );
          print("Save");
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF0a2f52),
        child: Text(
          'Add Job',
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
      appBar: AppBar(
        title: Text(
          'Add Job',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        //backgroundColor: Color(0xffEC7063),
        backgroundColor: Colors.transparent,
      ),
      // yellow backgroundColor: Color(0xffF7DC6F),
      //backgroundColor: Color(0xffEC7063),
      backgroundColor: Color(0xff2E86C1),
      body: ListView(
        //padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Stack(
            children: <Widget>[
              /*  Container(
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

               */

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
                                    height:MediaQuery.of(context).size.height * 1.8,//height: 1200,
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

                                        _jobTitle(),


                                        SizedBox(
                                          height: 20.0,
                                        ),


                                        _jobType(),


                                        SizedBox(
                                          height: 20.0,
                                        ),

                                        _jobCategory(),


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
                                        _country(),

                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        _city(),

                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        _qualification(),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        _experience(),

                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        _jobDescription(),
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


