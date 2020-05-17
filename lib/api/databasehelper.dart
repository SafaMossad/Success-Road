import 'dart:convert'show json;

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://flutterapitutorial.codeforiraq.org/api";
  var status;

  var token;

//  loginData(String email , String password) async{
//
//    String myUrl = "$serverUrl/login1";
//    final response = await  http.post(myUrl,
//        headers: {
//          'Accept':'application/json'
//        },
//        body: {
//          "email": "$email",
//          "password" : "$password"
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
//
//  registerData(String name ,String email , String password) async{
//
//    String myUrl = "$serverUrl/register1";
//    final response = await  http.post(myUrl,
//        headers: {
//          'Accept':'application/json'
//        },
//        body: {
//          "name": "$name",
//          "email": "$email",
//          "password" : "$password"
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

/*
  registerData(String email ,String password , String password_confirmation) async{
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/users";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"user":{"email": "$email","password": "$password","password_confirmation": "$password_confirmation"}}';
    // make POST request
    Response response = await post(url,
        headers: headers,
        body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
//    if(status){
//      print('data : ${data["error"]}');
//    }else{
//      print('data : ${data["token"]}');
//      _save(data["token"]);
//    }
    print('Response status : $statusCode');
    print('Response body : $body');

    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }

  }
*/

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
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data['error']}');
    } else {
      print('data : ${data['auth_token']}');
      _save('data ["auth_token"]');
    }
    print('Response status : $statusCode');
    print('Response body : $body');
  }

  loginData(String email, String password) async {
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/sessions";

    Map<String, String> headers = {"Content-type": "application/json"};

    String b = '{"email": "$email",'
        '"password": "$password"}';
    // make POST request
    Response response = await post(url, headers: headers, body: b);
    // check the status code for the result
    //int statusCode = response.statusCode;
    //the additional code
    status = response.body.contains('errors');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data['error']}');
    } else {
      print('token is = : ${data['auth_token']}');
      _save('data ["auth_token"]');
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

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}

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
