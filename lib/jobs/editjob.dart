import 'package:flutter/material.dart';
import 'package:successroad/api//databasehelper.dart';
import 'package:successroad/jobs/dashboard.dart';
import 'package:successroad/utilities/job_and_idea.dart';



class EditData extends StatefulWidget {
  List list;
  int index;
  EditData({this.index, this.list});

  @override
  EditDataState createState() => EditDataState();
}


class Gender {
  String gender;

  Gender(this.gender);

  static List<Gender> getGender() {
    return <Gender>[Gender("MAle"), Gender("Female"), Gender("Not prefer")];
  }
}



class Manage {
  String man;

  Manage(this.man);

  static List<Manage> getManage() {
    return <Manage>[Manage("fully"), Manage("semi"), Manage("Non")];
  }
}

class EditDataState extends State<EditData> {


  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController _jobTitleController = new TextEditingController();
  TextEditingController _jobTypeController = new TextEditingController();
  TextEditingController _jobCategoryController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _salaryController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();
  TextEditingController _countryController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _qualificationController = new TextEditingController();
  TextEditingController _experienceController = new TextEditingController();
  TextEditingController _jobDescriptionController = new TextEditingController();


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

  //ده الي هيتحطلي من البدايه
  Widget _jobTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      //width: 140.0,
      child: TextField(
        controller: _jobTitleController,
        keyboardType: TextInputType.emailAddress,
        style: txdont,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.title,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Job Title",
          labelStyle: kLabelStyle,
          hintText: 'Mobile App Developer',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _jobtybe() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
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
            Text("Job Tybe",
                style: TextStyle(
                    color: Color(0xFF0a2f52),
                    fontSize: 15.0,
                    fontFamily: 'co',
                    fontWeight: FontWeight.bold)),
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
                    fontSize: 20.0),
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

  Widget _jobCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      //width: 140.0,
      child: TextField(
        controller: _jobCategoryController,
        keyboardType: TextInputType.emailAddress,
        style: txdont,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.category,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Job Category",
          labelStyle: kLabelStyle,
          hintText: 'Software Engineering',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _address() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      //width: 140.0,
      child: TextField(
        controller: _addressController,
        keyboardType: TextInputType.emailAddress,
        style: txdont,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.add_location,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Address",
          labelStyle: kLabelStyle,
          hintText: 'Cairo,NasrCity',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _salary() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      //width: 140.0,
      child: TextField(
        controller: _salaryController,
        keyboardType: TextInputType.number,
        style: txdont,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.attach_money,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Salary",
          labelStyle: kLabelStyle,
          hintText: '01X XXX XXXX',
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
            Text(
              "Gender",
              style: TextStyle(
                  color: Color(0xFF0a2f52),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
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
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      //width: 140.0,
      child: TextField(
        controller: _qualificationController,
        keyboardType: TextInputType.emailAddress,
        style: txdont,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.question_answer,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Qualification",
          labelStyle: kLabelStyle,
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
      height: 65.0,
      //width: 140.0,
      child: TextField(
        controller: _experienceController,
        keyboardType: TextInputType.number,
        style: txdont,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.explicit,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Experience",
          labelStyle: kLabelStyle,
          hintText: 'Year Of Experience',
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
        style: txdont,
        maxLines: 10,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.description,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Job Description",
          labelStyle: kLabelStyle,
          hintText: 'Description',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }


  Widget _buildLoginBtns() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 150.0,
      child: RaisedButton(
        elevation: 20.0,
        onPressed: ()
        {
          databaseHelper.editDataJobs(
              widget.list[widget.index]['id'],
              _jobTitleController.text.trim(),
              _jobTypeController.text.trim(),
              _jobCategoryController.text.trim(),
              _addressController.text.trim(),
              _salaryController.text.trim(),
              _genderController.text.trim(),
              _qualificationController.text.trim(),
              _experienceController.text.trim(),
              _jobDescriptionController.text.trim());
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new CompanyDashboardjobs(),
          ));
          print("Edit");
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF0a2f52),
        child: Text(
          'Save Jobs',
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
    _jobTitleController =
    new TextEditingController(text: widget.list[widget.index]['title']);
    _jobTypeController = new TextEditingController(text: widget.list[widget.index]['jtype']);
    _jobCategoryController = new TextEditingController(text: widget.list[widget.index]['catagory']);
    _addressController = new TextEditingController(text: widget.list[widget.index]['address']);
    _salaryController = new TextEditingController(text: widget.list[widget.index]['salary']);
    _genderController = new TextEditingController(text: widget.list[widget.index]['gander']);

    _qualificationController = new TextEditingController(text: widget.list[widget.index]['qualification']);
    _experienceController = new TextEditingController(text: widget.list[widget.index]['experience']);
    _jobDescriptionController = new TextEditingController(text: widget.list[widget.index]['description']);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Job',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Job',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
          //backgroundColor: Color(0xffEC7063),
          //backgroundColor: Color(0xFFdadada),
          //backgroundColor: Color(0xff2E86C1),
          //backgroundColor: Color(0xFF233f5c),
          backgroundColor: Colors.transparent,
        ),

        backgroundColor: Color(0xff2E86C1),

        body: ListView(
          //padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            Stack(
              children: <Widget>[

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
                          //Padding(padding: EdgeInsets.all(10.0)),
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
                                      height: MediaQuery.of(context).size.height * 1.6,
                                      padding: EdgeInsets.only(top: 30.0),
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: <Widget>[


                                          _jobTitle(),


                                          SizedBox(
                                            height: 20.0,
                                          ),


                                          _jobtybe(),


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
