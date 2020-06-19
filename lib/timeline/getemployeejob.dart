import 'package:flutter/material.dart';
import 'package:successroad/api/databasehelper.dart';

class Employeejob extends StatefulWidget {
  @override
  _EmployeejobState createState() => _EmployeejobState();
}

class _EmployeejobState extends State<Employeejob> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      /* body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: new FutureBuilder<Map<String, dynamic>>(
                  future: databaseHelper.getEmployeejob(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print("snapshot.error");
                    return snapshot.hasData
                        ? new ItemList(list: snapshot.data)
                        : new Center(
                      child: new CircularProgressIndicator(),
                    );
                  },
                ),
//                  child: ListView.builder(
//                      itemCount: schoolLists.length,
//                      itemBuilder: (BuildContext context, int index) {
//                        return buildList(context, index);
//                      }),
              ),
            ],
          ),
        ),
      ),*/
      body: new FutureBuilder<List<dynamic>>(
        future: databaseHelper.getEmployeejob(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
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
          return new SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/94393013-team-work-in-training-room-with-planning-board.jpg",
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      top: 0.0,
                      left: 20.0,
                      right: 20.0,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.slideshow,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "My Jobs",
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      ),
                    )
                  ],
                ),

                //fot time
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Oct 21, 2017",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),

                      //title
                      Text(
                        "Title :${list[i]["job"]["title"]}",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF0a2f52),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),

                      //Row for Category & Manage
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.category,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Catagory: ${list[i]["job"]["catagory"]}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),




                          Icon(
                            Icons.open_with,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Job Tybe: ${list[i]["job"]["jtype"]}",
                            style: TextStyle(fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      //Padding(padding: EdgeInsets.only(right: 50.0)),
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
                            "Address: ${list[i]["job"]["address"]}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),



                          Icon(
                            Icons.monetization_on,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Salary: ${list[i]["job"]["salary"]}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),





                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.supervised_user_circle,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Gender: ${list[i]["job"]["gander"]}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          Icon(
                            Icons.vpn_lock,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "country: ${list[i]["job"]["country"]}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Address: ${list[i]["job"]["city"]}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),

                          Icon(
                            Icons.comment,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "qualification: ${list[i]["job"]["qualification"]}",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: <Widget>[
                        Row(children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Color(0xff2E86C1),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "eُxperience: ",
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFF0a2f52)),
                          ),
                        ],),
                          Container(
                            child: Text(
                              " اي كلا علشان يبان شكل الديسكريبشن لاكن ك كلام لا مفيش انا عاوز انتحر يا جماعه او عاوز اتخرج شايف العظمه ياض يا خالد تسلم ايد عمك صفا + ديه كلمه الداتا بيز ==>${list[i]["job"]["experience"]} .",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          )
                        ],
                      ),

                      Divider(
                        color: Color(0xff2E86C1),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Description :",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              "sadhas hdhash hdhas hdhja shdbh asjhbdj jhdbas jhbdba sjhdb hjas bhbd"
                              "asd as gsd aas basba dsbhja sbsnb ndsbnas bndbnb nasbns dbbna sbndb nasbn bndbnad sbnadsb"
                              "savd cga sgh asvb nad sbna db n sdbna sd b nba s asbnasjkhgdg ashd hgadgga  sgjhd ghasj"
                              "asnasv ashvad  svhvhdjb asnbbndbn  asbnvdv ansdgvash  dghasvhvdv asghgvdghasghv"
                              " ${list[i]["job"]["description"]} .",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0xFF0a2f52)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black87,
                  thickness: 1.0,
                  height: 50.0,
                )
              ],
            ),
          );
/*          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              */ /*onTap: () {

                print('khaled');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowData(list:list , index:i)),
                );
              },*/ /*
              child: new Container( alignment: Alignment.topLeft,
                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 325,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              list[i]["job"]["title"],
                              style: TextStyle(
                                  //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),

                            Text(
                              list[i]["job"]["jtype"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]["job"]["catagory"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),

                            Text(
                              list[i]["job"]["address"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]["job"]["salary"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),

                            Text(
                              list[i]["job"]["gander"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]["job"]["country"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),

                            Text(
                              list[i]["job"]["city"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]["job"]["qualification"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),

                            Text(
                              list[i]["job"]["experience"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              list[i]["job"]["description"],
                              style: TextStyle(
                                //color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),



                          ],

                ),

//                child: new ListTile(
//                  title: new Text(list[i]['title'],
//                      style: TextStyle(
//                          fontSize: 18.0,
//                          color: Color(0xFF0a2f52),
//                          fontWeight: FontWeight.bold)),
//                  leading: new Icon(
//                    Icons.apps,
//                    color: Color(0xFF0a2f52),
//                    size: 35.5,
//                  ),
//                  subtitle: new Text(
//                    'Idea Catagory : ${list[i]['ideacatagory']}',
//                  ),
//                ),
              ),

            ),
          );*/
        });
  }
}
