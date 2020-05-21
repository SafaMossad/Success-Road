import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://flutterapitutorial.codeforiraq.org/api";
  var status;

  var auth_token;

  registerData(
      String email, String password, String passwordConfirmation) async {
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
    // this API passes back the id of the new item added to the body
    // String body = response.body;
    //print('Response status : $statusCode');
    //print('Response body : $body');

    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
  }

//  loginData(String email , String password) async{
//
//    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/sessions";
//    final response = await  http.post(myUrl,
//        headers: {
//          'Accept':'application/json',
//          "Content-type": "application/json"
//        },
//        body: {
//          "email": "$email",
//          "password": "$password"
//        } ) ;
//    status = response.body.contains('error');
//
//    var data = json.decode(response.body);
//
//    if(status){
//      print('data : ${data["error"]}');
//    }else{
//      print('data : ${data["token"]}');
//      _save(data["token"]);
//    }
//
//  }

//  void addDataIdea(String ideaTitle , String managementType , String ideaCategory  ,
//      String address ,String funding, String ideaDescription) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'auth_token';//'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key ) ?? 0;
//    //https://successsroadv2.herokuapp.com/ideas
//    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/ideas";
//    http.post(myUrl,
//        headers: {
//          //'Accept':'*/*',
//          'Accept' :'application/json',
//          //token QW4BzRGsRtmU9ymjJhz8  ,4E6pQe5VJv9anK1un9s7
//          'Authorization' : ' $value',
//        },
//        body: {
//          //name of attrbuite
//          "title": "$ideaTitle",
//          "Management" :"$managementType",
//          "ideacatagory" : "$ideaCategory",
//          "address" :"$address",
//          "funding" :"$funding",
//          "ideaDescription" :"$ideaDescription"
//        }).then((response){
//      print('Response status : ${response.statusCode}');
//      print('Response body : ${response.body}');
//    });
//  }

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
//    final response = await http.get(
//      getData,
//      headers: {
//        'Accept' :'*/*',
//        'Accept-Encoding':'gzip, deflate, br',
//        'Connection':'keep-alive',
//        'Content-Type': 'application/json',
//        'Authorization': '$token'
//      },
//    );
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

//  void editDataIdea(
//      int id,
//      String ideaTitle,
//      String managementType,
//      String ideaCategory,
//      String address,
//      String funding,
//      String ideaDescription) async {
////    final prefs = await SharedPreferences.getInstance();
////    final key = 'auth_token'; //'4E6pQe5VJv9anK1un9s7';
////    final value = prefs.get(key) ?? 0;
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    var token = prefs.getString('token');
//    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/ideas/$id";
//    http.put(myUrl, headers: {
//      //'Accept':'*/*',
//      'Accept' :'*/*',
//      'Accept-Encoding':'gzip, deflate, br',
//      'Connection':'keep-alive',
//      //'Content-Type': 'application/json',
//      'Authorization': '$token'
//    }, body: {
//      "title": "$ideaTitle",
//      "Management": "$managementType",
//      "ideacatagory": "$ideaCategory",
//      "address": "$address",
//      "funding": "$funding",
//      "ideaDescription": "$ideaDescription"
//    }).then((response) {
//      print('Response status : ${response.statusCode}');
//      print('Response body : ${response.body}');
//    });
//  }

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

//return json.decode(response.body);
//    http.post(myUrl,
//        headers: {
//          'Accept':'*/*',
//          //token QW4BzRGsRtmU9ymjJhz8
//          'Authorization' : 'Bearer $value'
//        },
//        body: {
//          //name of attrbuite
//          "title": "$jobTitle",
//          "jtype" : "$jobType",
//          "category" :"$jobCategory",
//          "address" :"$address",
//          "salary" :"$salary",
//          "gander" :"$gander",
//          "country" :"$country",
//          "city" :"$city",
//          "qualification" :"$qualification",
//          "experience" :"$experience",
//          "description" :"$description",
//        }).then((response){
//      print('Response status : ${response.statusCode}');
//      print('Response body : ${response.body}');
//    });

//  String addDataIdea = "https://successsroadv2.herokuapp.com/api/v1/ideas";
//
//  final Map<String, dynamic> orderData = {
//    "title": "$ideaTitle",
//    "Management" :"$managementType",
//    "ideacatagory" : "$ideaCategory",
//    "address" :"$address",
//    "funding" :"$funding",
//    "ideaDescription" :"$ideaDescription"
//  };
//
//  final response = await http.post(
//  addDataIdea,
//  body: json.encode(orderData),
//  headers: {
//  'Content-Type': 'application/json',
//  'Authorization': 'Bearer $token'
//  },
//  );

/*

Future<List> getData() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products/";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    return json.decode(response.body);
  }

  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products/$id";
    http.delete(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void addData(String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products";
    http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name": "$name",
          "price" : "$price"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


  void editData(int id,String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name": "$name",
          "price" : "$price"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


 */
