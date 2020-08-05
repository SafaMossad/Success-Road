import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';


class ShowIdeaDataforCompany extends StatefulWidget {
  List list;
  int index;

  ShowIdeaDataforCompany({this.index, this.list});

  @override
  ShowIdeaDataforCompanyState createState() => ShowIdeaDataforCompanyState();
}

class ShowIdeaDataforCompanyState extends State<ShowIdeaDataforCompany> {
  DatabaseHelper databaseHelper = new DatabaseHelper();






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Show Idea'),
        centerTitle: true,
        backgroundColor: Color(0xff1B4F72),
        actions: <Widget>[

        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/94393013-team-work-in-training-room-with-planning-board.jpg',
                    fit: BoxFit.fill,
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                decoration: BoxDecoration(
                    color: Color(0xFFe7e7e7),
                    borderRadius: BorderRadius.circular(5.0)),
                padding: const EdgeInsets.all(16.0),


                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "Title: ${widget.list[widget.index]['title']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Idea Catagory: ${widget.list[widget.index]['ideacatagory']}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    Divider(),

                    Column(
                      children: <Widget>[

                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.monetization_on,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Funding: ${widget.list[widget.index]['funding']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.0),
                        Divider(),


                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.supervisor_account,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Management: ${widget.list[widget.index]['Management']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(height: 10.0),
                    Divider(),

                    Column(
                      children: <Widget>[

                        Row(
                          children: <Widget>[

                            Icon(
                              Icons.location_on,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Address: ${widget.list[widget.index]['address']}",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ],
                        ),

                      ],
                    ),


                    SizedBox(height: 10.0),
                    Divider(),

                    Column(

                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.description,
                              color: Color(0xff2E86C1),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Description :'),
                          ],
                        ),

                        Container(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            children: <Widget>[
                              Text("${widget.list[widget.index]['ideaDescription']}",
                                style: TextStyle(
                                    fontSize: 15.0, color: Color(0xFF0a2f52)),)
                            ],
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: 30.0),

                  ],
                ),
              ),
            ],
          ),
        ),
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
