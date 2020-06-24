
import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';
import 'package:successroad/ideas/dashboard.dart';
import 'package:successroad/jobs/addjob.dart';
import 'package:successroad/jobs/dashboard.dart';

import '../ideas/showidea.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ShowOneApplyJob extends StatefulWidget {
  List list;
  int index ;

  ShowOneApplyJob({ this.list,this.index});

  @override

  ShowOneApplyJobState createState() => ShowOneApplyJobState();
}

final primary = Color(0xff1B4F72);
final secondary = Color(0xfff29a94);

class ShowOneApplyJobState extends State<ShowOneApplyJob> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
   // var id=widget.id[widget.index]['Management'];
    return Scaffold(
       /* body: new FutureBuilder<List<dynamic>> (

          future: databaseHelper.getCompanyApply(widget.list[widget.index]['id']),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            print('project snapshot !!!!!!!!!!!!! data is: ${widget.list[widget.index]['id']}');
            return snapshot.hasData
                ? new ItemList(list: snapshot.data)
                : new Center(
              child: new CircularProgressIndicator(),
            );
          },

        )*/
        appBar: AppBar(
          backgroundColor: primary,
          title:Text( "All Requestes"),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,  // add custom icons also
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(top: 120),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: new FutureBuilder<List>(
                    future: databaseHelper.getCompanyApplyedJobs(widget.list[widget.index]['id']),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print("snapshot.error");
                      return snapshot.hasData
                          ? new ItemList(list: snapshot.data)
                          : new Center(
                        child: new CircularProgressIndicator(),
                      );
                    },
                  ),

                ),


              ],
            ),
          ),
        )

    );
  }
}



class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
            child: new GestureDetector(
             /* onTap: () {
                //print('khaled');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowData(list: list, index: i)),
                );
              },*/
              child: new Container(
                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                //height of white container
                height: 150,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3, color: Colors.white),
                          image: DecorationImage(
                              image: new ExactAssetImage('assets/Prlogo.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              list[i]['user']['email'],
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              list[i]['user']['employee']['name'],
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              list[i]['user']['employee']['jobtybe'],
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),

                          ],
                        ),
                      ),
                    ]),


              ),


            ),
          );
        });
  }
}
