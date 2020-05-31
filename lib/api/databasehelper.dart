import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://flutterapitutorial.codeforiraq.org/api";
  var status;
  var ides ;
  var auth_token;

  signup(String email, String password, String passwordConfirmation) async {
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/users";
    Map<String, String> headers = {"Content-type": "application/json"};
    String b =
        '{"user":{"email": "$email","password": "$password","password_confirmation": "$passwordConfirmation"}}';
    // make POST request
    Response response = await post(url, headers: headers, body: b);
    // check the status code for the result
    //int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    //String body = response.body;
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data['error']}');
    } else {
      print('token : ${data['auth_token']}');
      _save('data ["auth_token"]');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['auth_token']);
      /*_save('data ["auth_token"]');
      print('id : ${data['id']}');
    _saved('data ["id"]');*/
      print('id : ${data['id']}');
      ides =data ["id"];

    }
//    print('Response status : $statusCode');
//    print('Response body : $body');
  }

  ideaMakerRegister(String name, String jobtitle,
      String mobile,String address,
      String gender, String location, String qualifiction,
      String interstingfield,String indestry) async {
    print('id : $ides');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/users/$ides/profile";

    final Map<String, dynamic> b =
    {
      "profile_type": 3,
      "ideamaker":
      {
        "name": "$name",
        "jobtitle": "$jobtitle",
        "addree": "$address",
        "location": "$location",
        "Gander": "$gender",
        "qualifiction": "$qualifiction",
        "mobile": "$mobile",
        "interstingfield": "$interstingfield",
        "indestry": "$indestry"

      }
    };
    // make POST request
    final response = await http.post(
        url,
      body: json.encode(b)
      ,headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
        },
        );
    print('Response status : ${response.statusCode}');
    print('Response body : ${response.body}');
    print('id : $ides');
//    print('Response status : $statusCode');
//    print('Response body : $body');
  }

  sponsorRegister(int id,String firstname, String lastname, String phone,String address, String categoey,String gender, String manage) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');


    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/users/$id/profile";

    final Map<String, dynamic> b = {"name": "$firstname","Address": "$address",
      "Catagory": "$phone","Catagory":"$categoey",
        "Gander":"$gender","Typemanagment":"$manage"
    };
    // make POST request
    Response response = await post(url,
        headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    }, body: json.encode(b));

    print('Response body : ${response.body}');
//    print('Response status : $statusCode');
//    print('Response body : $body');
  }

  employeeRegister(String email, String password, String passwordConfirmation) async {
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/users";
    Map<String, String> headers = {"Content-type": "application/json"};
    String b =
        '{"user":{"email": "$email","password": "$password","password_confirmation": "$passwordConfirmation"}}';
    // make POST request
    Response response = await post(url, headers: headers, body: b);

    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data['error']}');
    } else {
      print('data : ${data['auth_token']}');
      _save('data ["auth_token"]');
    }
//    print('Response status : $statusCode');
//    print('Response body : $body');
  }

  loginData(String email, String password) async {
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/sessions";
    Map<String, String> headers = {"Content-type": "application/json"};
    String b = '{"email": "$email","password": "$password"}';
    // make POST request
    Response response = await post(url, headers: headers, body: b);
    // check the status code for the result
    //int statusCode = response.statusCode;
    //the additional code
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data['error']}');
    } else {
      print('data : ${data['auth_token']}');
      _save('data ["auth_token"]');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['auth_token']);
    }

  }



  void addDataIdea(String ideaTitle, String managementType, String ideaCategory,
      String address, String funding, String ideaDescription) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'Authorization';//'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key ) ?? 0;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    String addDataIdea = "https://successsroadv2.herokuapp.com/api/v1/ideas";
    //print('Token : iAWGJsMzWFN9CEB1RmkU');
    print('Token : $token');
    final Map<String, dynamic> orderData = {
      "title": "$ideaTitle",
      "Management": "$managementType",
      "ideacatagory": "$ideaCategory",
      "address": "$address",
      "funding": "$funding",
      "ideaDescription": "$ideaDescription"
    };
    final response = await http.post(
      addDataIdea,
      body: json.encode(orderData),
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );
    print('Response body : ${response.body}');
//    var data = json.decode(response.body);
//    print('Response status : ${response.statusCode}');

//    print('data : ${data['auth_token']}');
  }

  Future<List> getData() async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'auth_token'; //'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key) ?? 0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/ideas";
    http.Response response = await http.get(myUrl, headers: {
      //'Accept':'*/*',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    return json.decode(response.body);
  }

  void editDataIdea(
      int id,
      String ideaTitle,
      String managementType,
      String ideaCategory,
      String address,
      String funding,
      String ideaDescription) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'Authorization';//'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key ) ?? 0;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String url = "https://successsroadv2.herokuapp.com/api/v1/ideas/$id";
    //print('Token : iAWGJsMzWFN9CEB1RmkU');
    print('Token : $token');
    final Map<String, dynamic> orderData = {
      "title": "$ideaTitle",
      "Management": "$managementType",
      "ideacatagory": "$ideaCategory",
      "address": "$address",
      "funding": "$funding",
      "ideaDescription": "$ideaDescription"
    };
    final response = await http.put(
      url,
      body: json.encode(orderData),
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );
    print('Response body : ${response.body}');
//    var data = json.decode(response.body);
//    print('Response status : ${response.statusCode}');

//    print('data : ${data['auth_token']}');
  }


  void deleteData(int id) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'auth_token'; //'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key) ?? 0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/ideas/$id";
    http.delete(myUrl, headers: {
      //'Accept':'*/*',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  //Start Api Jobs.

  void addDataJobs(
      String jobTitle,
      String jobType,
      String jobCategory,
      String address,
      String salary,
      String gander,
      String country,
      String city,
      String qualification,
      String experience,
      String description) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'Authorization';//'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key ) ?? 0;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String addDataJobs = "https://successsroadv2.herokuapp.com/api/v1/jobs";
    //print('Token : iAWGJsMzWFN9CEB1RmkU');
    print('Token : $token');
    final Map<String, dynamic> orderData = {
      "title": "$jobTitle",
      "jtype": "$jobType",
      "catagory": "$jobCategory",
      "address": "$address",
      "salary": "$salary",
      "gander": "$gander",
      "country": "$country",
      "city": "$city",
      "qualification": "$qualification",
      "experience": "$experience",
      "description": "$description"
    };
    final response = await http.post(
      addDataJobs,
      body: json.encode(orderData),
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );
    print('Response status : ${response.statusCode}');
    print('Response body : ${response.body}');
  }

  void editDataJobs(
      int id,
      String jobTitle,
      String jobType,
      String jobCategory,
      String address,
      String salary,
      String gander,
      String country,
      String city,
      String qualification,
      String experience,
      String description) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'token';
//    final value = prefs.get(key ) ?? 0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String myUrl = "https://successsroadv2.herokuapp.com/jobs/$id";
    http.put(myUrl, headers: {
      //'Accept':'*/*',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      //'Content-Type': 'application/json',
      'Authorization': '$token'
    }, body: {
      "title": "$jobTitle",
      "jtype": "$jobType",
      "catagory": "$jobCategory",
      "address": "$address",
      "salary": "$salary",
      "gander": "$gander",
      "country": "$country",
      "city": "$city",
      "qualification": "$qualification",
      "experience": "$experience",
      "description": "$description"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  Future<List> getDataJobs() async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'auth_token'; //'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key) ?? 0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/jobs";
    http.Response response = await http.get(myUrl, headers: {
      //'Accept':'*/*',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      //'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    return json.decode(response.body);
  }

  void deleteDataJobs(int id) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'token';
//    final value = prefs.get(key ) ?? 0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/jobs/$id";
    http.delete(myUrl, headers: {
      //'Accept':'*/*',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      //'Content-Type': 'application/json',
      'Authorization': '$token'
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'auth_token';
    final value = token;
    prefs.setString(key, value);
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'auth_token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
