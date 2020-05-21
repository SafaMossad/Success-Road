import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/jobs/dashboard.dart';
import 'package:successroad/jobs//editjob.dart';




class ShowData extends StatefulWidget{

  List list;
  int index;
  ShowData({this.index , this.list}) ;


  @override
  ShowDataState  createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Show Jobs',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Show Jobs'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: ()=>Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Dashboard(),
                  )
              ),
            )
          ],
        ),



        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[

              Container(
                height: 50,
                child: new Text(
                  "Idea Title : ${ widget.list[widget.index]['title']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Job Type : ${widget.list[widget.index]['jtype']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Job Category : ${widget.list[widget.index]['category']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Address : ${widget.list[widget.index]['address']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Salary : ${widget.list[widget.index]['salary']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Gander : ${widget.list[widget.index]['gander']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Country : ${widget.list[widget.index]['country']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "city : ${widget.list[widget.index]['city']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Qualification : ${widget.list[widget.index]['qualification']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Experience : ${widget.list[widget.index]['experience']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  "Description : ${widget.list[widget.index]['description']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new Text(
                  " Created at : ${widget.list[widget.index]['created_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                height: 50,
                child: new Text(
                  " Updated at : ${widget.list[widget.index]['updated_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new EditData(list:widget.list , index:widget.index),
                          )
                      ),
                      color: Colors.green,
                      child: new Text(
                        'Edit',
                        style: new TextStyle(
                          color: Colors.white,
                        ),),
                    ),
                  ),

                  Container(
                    height: 50,
                    child: new FlatButton(
                      onPressed: (){
                        databaseHelper.deleteDataJobs(widget.list[widget.index]['id']);
                        Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) => new Dashboard(),
                            )
                        );
                      },
                      color: Colors.blue,
                      child: new Text(
                        'Delete',
                        style: new TextStyle(
                          color: Colors.red,
                        ),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



//  void _showDialog(){
//    showDialog(
//        context:context ,
//        builder:(BuildContext context){
//          return AlertDialog(
//            title: new Text('Failed'),
//            content:  new Text('Check your email or password'),
//            actions: <Widget>[
//              new RaisedButton(
//
//                child: new Text(
//                  'Close',
//                ),
//
//                onPressed: (){
//                  Navigator.of(context).pop();
//                },
//
//              ),
//            ],
//          );
//        }
//    );
//  }
}