import 'package:flutter/material.dart';
import 'package:successroad/timeline/choocenavigationIdeaMaker.dart';
import 'package:successroad/utilities/job_and_idea.dart';
import 'package:successroad/api/databasehelper.dart';

class AddIdea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddIdeaState();
  }
}

class AddIdeaState extends State<AddIdea> {
  //ده الي هيتحطلي من البدايه

  DatabaseHelper databaseHelper = new DatabaseHelper();

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


  Widget _ideaTitle() {
    return Container(
      // alignment: Alignment.topCenter,
      // padding: EdgeInsets.only(bottom:10.0),
      decoration: kBoxDecorationStyle,
      height: 65.0,
      //width: 165.0,
      child: TextField(
        controller: _ideaTitleController,
        keyboardType: TextInputType.emailAddress,
        style: txdont,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.title,
            color: Color(0xFF8b8b8b),
          ),
         labelText: "Idea Title",
         labelStyle: kLabelStyle,
          hintText: 'Investment in Sport',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _ideaCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      //width: 165.0,
      child: TextField(
        controller: _ideaCategoryController,
        keyboardType: TextInputType.emailAddress,
        style: txdont,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.category,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Idea Category",
          labelStyle: kLabelStyle,
          hintText: 'Investment',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _funding() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      // width: 150.0,
      child: TextField(
        controller: _fundingController,
        keyboardType: TextInputType.number,
        style: txdont,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.attach_money,
            color: Color(0xFF8b8b8b),
          ),
         labelText: "Funding",
          labelStyle: kLabelStyle,
          hintText: "20,000",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _typeofmanagment() {
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
              Icons.supervisor_account,
              color: Color(0xFF8b8b8b),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "Mangment",
              style: TextStyle(
                color: Color(0xFF0a2f52),
                fontFamily: 'OpenSans',
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
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

  Widget _address() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 65.0,
      // width: 150.0,
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
          hintText: "Cairo,Nasr City",
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
        controller: _ideaDescriptionController,
        keyboardType: TextInputType.multiline,
        style: txdont,

        maxLines: 20,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.description,
            color: Color(0xFF8b8b8b),
          ),
          labelText: "Idea Description",
          labelStyle: kLabelStyle,
          hintText: "Description",
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
        onPressed: () {
          databaseHelper.addDataIdea(
              _ideaTitleController.text.trim(),
              mangmentdropdownValue.trim(),
              _ideaCategoryController.text.trim(),
              _addressController.text.trim(),
              _fundingController.text.trim(),
              _ideaDescriptionController.text.trim());

          Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new IdeaMakerTimeline(),
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


  final TextEditingController _ideaTitleController = new TextEditingController();
  final TextEditingController _ideaCategoryController = new TextEditingController();
  final TextEditingController _fundingController = new TextEditingController();
  final TextEditingController _managementTypeController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _ideaDescriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Idea',
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,

        backgroundColor: Colors.transparent,
      ),

      backgroundColor: Color(0xff2E86C1),
      //backgroundColor: Color(0xFFdadada),
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
                          height: 670.0,
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
                                    height: MediaQuery.of(context).size.height * 1.1,
                                    padding: EdgeInsets.only(top: 5.0),
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      children: <Widget>[

                                        _ideaTitle(),

                                        SizedBox(
                                          height: 15.0,
                                        ),

                                        _ideaCategory(),

                                        SizedBox(
                                          height: 15.0,
                                        ),

                                        _funding(),

                                        SizedBox(
                                          height: 15.0,
                                        ),

                                        _typeofmanagment(),

                                        SizedBox(
                                          height: 15.0,
                                        ),

                                        _address(),

                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        _ideaDescription(),

                                        SizedBox(
                                          height: 12.0,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
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

