import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  var status;
  var nauth_toke;
  var ideamaker;
  var sponsor;
  var employee;


  //sign up form
  signup(String email, String password, String passwordConfirmation) async {
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/users";
    Map<String, String> headers = {"Content-type": "application/json"};
    String b =
        '{"user":{"email": "$email","password": "$password","password_confirmation": "$passwordConfirmation"}}';
    // make POST request
    Response response = await post(url, headers: headers, body: b);



    // check the status code for the result
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data['error']}');
    } else {
      print('token : ${data['auth_token']}');
      //  _save('data ["auth_token"]');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['auth_token']);
      print('id : ${data['id']}');

      final SharedPreferences prefsidid = await SharedPreferences.getInstance();
      prefsidid.setInt('id now is', data['id']);
    }

  }

  //registration fo Comoany
  companyRegister(String name,  String address, String gender, String qualifiction,String mobile, String interstingfield, String ideamakerBio, String website, String size, String ownernaem, String ownerphono, String owneraddress,String companyemail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsidid = await SharedPreferences.getInstance();
    var idis = prefsidid.getInt('id now is');
    // set up POST request arguments
    String url =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idis/profile";

    final Map<String, dynamic> b = {
      "profile_type": 3,
      "ideamaker": {
        "name": "$name",
        "Website": "$website",
        "addree": "$address",
        "Gander": "$gender",
        "qualifiction": "$qualifiction",
        "mobile": "$mobile",
        "interstingfield": "$interstingfield",
        "size":"$size",
        "ideamakerBio":"$ideamakerBio",
        "ownernaem": "$ownernaem",
        "ownerphono":"$ownerphono",
        "owneraddress":"$owneraddress",
        "companyemail":"$companyemail"
      }
    };
    // make POST request
    final response = await http.post(
      url,
      body: json.encode(b),
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
    print('id final : $idis');

//    print('Response status : $statusCode');
//    print('Response body : $body');
  }

  sponsorRegister(String name, String address, String catagory, String gender, String funding, String typemanagment, String phone, String experince, String bio) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsidid = await SharedPreferences.getInstance();
    var idis = prefsidid.getInt('id now is');
    // set up POST request arguments
    String url =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idis/profile";

    final Map<String, dynamic> body = {
      "profile_type": 2,
      "sponser": {
        "name": "$name",
        "Address": "$address",
        "Catagory": "$catagory",
        "Gander": "$gender",
        "Funding": "$funding",
        "Typemanagment": "$typemanagment",
        "phone": "$phone",
        "exprience": "$experince",
        "sponcerBio": "$bio"
      }
    };

    // make POST request
    final response = await http.post(
      url,
      body: json.encode(body),
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
    print('id final : $idis');

//    print('Response status : $statusCode');
//    print('Response body : $body');
  }

  employeeRegister(String name, String jobtybe, String jobcategory, String address, String salary, String gander, String qualifcation, String mobile, String degree, String indestry, String exprense, String employeeBio, String datefrom, String dateto,) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsidid = await SharedPreferences.getInstance();
    var idis = prefsidid.getInt('id now is');
    // set up POST request arguments
    String url =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idis/profile";

    final Map<String, dynamic> body = {
      "profile_type": 1,
      "employee": {
        "name": "$name",
        "jobtybe": "$jobtybe",
        "jobcategory": "$jobcategory",
        "address": "$address",
        "salary": "$salary",
        "Gander": "$gander",
        "Qualifcation": "$qualifcation",
        "mobile": "$mobile",
        "Degree": "$degree",
        "Indestry": "$indestry",
        "Exprense": "$exprense",
        "employeeBio": "$employeeBio",
        "Datafrom": "$datefrom",
        "Datato": "$dateto"
      }
    };

    // make POST request
    final response = await http.post(
      url,
      body: json.encode(body),
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
    print('id final : $idis');


  }

  loginData(String email, String password) async {
    // set up POST request arguments
    String url = "https://successsroadv2.herokuapp.com/api/v1/sessions";
    Map<String, String> headers = {"Content-type": "application/json"};
    String b = '{"email": "$email","password": "$password"}';
    // make POST request
    Response response = await post(url, headers: headers, body: b);
    // check the status code for the result

    //the additional code
    status = response.body.contains('error');
    ideamaker = response.body.contains('ideamaker');
    sponsor = response.body.contains('sponser');
    employee = response.body.contains('employee');
    var data = json.decode(response.body);

    print('login Body : $data');
    if (status) {
      print('data : ${data['error']}');
    }
    else {


      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['auth_token']);
      print('login token is : ${data['auth_token']}');

      final SharedPreferences prefsididlogin = await SharedPreferences.getInstance();
      prefsididlogin.setInt('loginid', data['id']);
      print('login User ID is : ${data['id']}');
    }
  }


  void addDataJobs(String jobTitle, String jobType, String jobCategory, String address, String salary, String gander, String qualification, String experience, String description) async {

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

  applyFunding(int ideaid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin =
    await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');

    String applyFunding =
        "https://successsroadv2.herokuapp.com/api/v1/funds?id =$idislogin";

    final Map<String, dynamic> orderData = {
      "user_id": "$idislogin",
      "idea_id": "$ideaid",
    };

    final response = await http.post(
      applyFunding,
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

  Future<List<dynamic>> getSponsorinvest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin =
    await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');

    String applyFunding = "https://successsroadv2.herokuapp.com/api/v1/funds";
    http.Response response = await http.get(applyFunding, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    print("body now in get emp job ${response.body}");
    return json.decode(response.body.toString());
  }

  void acceptJobRequest(int id) async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');


    String myUrl =
        "https://successsroadv2.herokuapp.com/api/v1/Responce/$id";
    print(id);
    final Map<String, dynamic> orderData = {

        "Responce": "Accept",
    };
    final response = await http.put(
      myUrl,
      body: json.encode(orderData),
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );
    print(id);
    print('Response body response supmitting : ${response.body}');

  }

  void acceptIdeaRequest(int id) async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');


    String myUrl =
        "https://successsroadv2.herokuapp.com/api/v1/ResponceFund/$id";
    print(id);
    final Map<String, dynamic> orderData = {

      "Responce": "Accept",
    };
    final response = await http.put(
      myUrl,
      body: json.encode(orderData),
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );
    print(status);
    print('Response body response supmitting : ${response.body}');

  }


  //post apply jobs
  applyjop(int jobid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin =
    await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');

    String applyjobapi =
        "https://successsroadv2.herokuapp.com/api/v1/submittings";

    final Map<String, dynamic> orderData = {
      "user_id": "$idislogin",
      "job_id": "$jobid",
    };

    final response = await http.post(
      applyjobapi,
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

  //post favorite jobs
  favoriteJop(int jobid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin = await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');


    //to check job id right ??
    print('job id : $jobid');


    String favoriteJopUrl =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/Jobfavoutit";

    final Map<String, dynamic> orderData = {
      //"user_id": "$idislogin",
      "job_id": "$jobid",
    };

    final response = await http.post(
      favoriteJopUrl,
      body: json.encode(orderData),
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );
    status = response.body.contains('canideao');
    print('Response status : ${response.statusCode}');
    print('Response body : ${response.body}');
  }

  //Get Favorite Jobs
  Future<List<dynamic>> getFavoriteJobs() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin = await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');


    String getFavoriteJobs = "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/Jobfavoutit";
    http.Response response = await http.get(getFavoriteJobs, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    //print(id.toString() + ' hhhhhhh final');
    // print(response.body);
    print("body getFavoriteJobs job ${response.body}");
    return json.decode(response.body.toString());
  }


//post favorite ideas
  favoriteIdea(int ideaid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin = await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');


    //to check job id right ??
    print('Idea id : $ideaid');


    String favoriteJopUrl =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/Ideafavoutit";

    final Map<String, dynamic> orderData = {
      //"user_id": "$idislogin",
      "idea_id": "$ideaid",
    };

    final response = await http.post(
      favoriteJopUrl,
      body: json.encode(orderData),
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );
    /*  if (response.statusCode == 400){
      print("miss ideae you can ideao it again");
    }else*/
    //  status = response.body =="";
    status = response.body.contains('canideao');
    print('Response status : ${response.statusCode}');
    print('Response body : ${response.body}');
  }

  //Get Favorite Idea
  Future<List<dynamic>> getFavoriteIdea() async {
//    print(id.toString() + '!!!!first!!!');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin = await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');

    String getFavoriteIdeaUrl =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/Ideafavoutit";
    http.Response response = await http.get(getFavoriteIdeaUrl, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    //print(id.toString() + ' hhhhhhh final');
    // print(response.body);
    print("body getFavoriteJobs job ${response.body}");
    return json.decode(response.body.toString());
  }

  Future<List> getCurrenUserIdeas() async {

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

  Future<List<dynamic>> getCompanyApplyedJobs(int id) async {
    print(id.toString() + '!!!!first!!!');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    String getCompanyApply =
        "https://successsroadv2.herokuapp.com/api/v1/submittingsa?id=$id";
    http.Response response = await http.get(getCompanyApply, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    print(id.toString() + ' hhhhhhh final');
    // print(response.body);
    print("body getCompanyApply job ${response.body}");
    return json.decode(response.body.toString());
  }

  Future<List<dynamic>> getCompanyApplyedIdeas(int id) async {
    //print(id.toString() + '!!!!first!!!');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    String getCompanyApply =
        "https://successsroadv2.herokuapp.com/api/v1/ideafund?id=$id";
    http.Response response = await http.get(getCompanyApply, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    //print(id.toString() + '  idea final');
    // print(response.body);
    print("body getCompanyApply job${response.body}");
    return json.decode(response.body.toString());
  }


  Future<List<dynamic>> getEmployeejob() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    String getemployeejob =
        "https://successsroadv2.herokuapp.com/api/v1/submittings";
    http.Response response = await http.get(getemployeejob, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    print("body now in get emp job ${response.body}");
    return json.decode(response.body.toString());
  }

//GETPROFILE
  Future<Map<String, dynamic>> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin =
    await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('login id for profile : $idislogin');

    String myUrl =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/profile";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    print("Profile body  ${response.body}");
    return json.decode(response.body.toString());
  }

  void editIdeaMakerData(String name, String address, String gender, String qualifiction, String mobile, String interstingfield, String ideamakerBio, String website,String size, String ownernaem, String ownerphono , String owneraddress) async {
//

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin =
    await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');

    String myUrl =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/profile";
    final Map<String, dynamic> orderData = {
      "profile_type": 3,
      "ideamaker": {
        "name": "$name",
        "addree": "$address",
        "Gander": "$gender",
        "qualifiction": "$qualifiction",
        "mobile": "$mobile",
        "interstingfield": "$interstingfield",
        "ideamakerBio": "$ideamakerBio",
        "Website": "$website",
        "size": "$size",
        "ownernaem": "$ownernaem",
        "ownerphono": "$ownerphono",
        "owneraddress": "$owneraddress"
      }
    };
    final response = await http.put(
      myUrl,
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

  void editSponsorData(String name, String address, String catagory,String gender, String funding, String typemanagment, String phone, String experince, String bio,) async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'Authorization';//'4E6pQe5VJv9anK1un9s7';
//    final value = prefs.get(key ) ?? 0;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin =
    await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');

    String myUrl =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/profile";
    final Map<String, dynamic> orderData = {
      "profile_type": 2,
      "sponser": {
        "name": "$name",
        "Address": "$address",
        "Catagory": "$catagory",
        "Gander": "$gender",
        "Funding": "$funding",
        "Typemanagment": "$typemanagment",
        "phone": "$phone",
        "exprience": "$experince",
        "sponcerBio": "$bio",
      }
    };
    final response = await http.put(
      myUrl,
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

  void editEmployeeData(String name, String jobtybe, String jobcategory, String address, String salary, String gander, String qualifcation, String mobile, String degree, String indestry, String exprense, String employeeBio, String datefrom, String dateto,) async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('Token : $token');

    final SharedPreferences prefsididlogin =
    await SharedPreferences.getInstance();
    var idislogin = prefsididlogin.getInt('loginid');
    print('loginid : $idislogin');

    String myUrl =
        "https://successsroadv2.herokuapp.com/api/v1/users/$idislogin/profile";
    final Map<String, dynamic> orderData = {
      "profile_type": 1,
      "employee": {
        "name": "$name",
        "jobtybe": "$jobtybe",
        "jobcategory": "$jobcategory",
        "address": "$address",
        "salary": "$salary",
        "Gander": "$gander",
        "Qualifcation": "$qualifcation",
        "mobile": "$mobile",
        "Degree": "$degree",
        "Indestry": "$indestry",
        "Exprense": "$exprense",
        "employeeBio": "$employeeBio",
        "Datafrom": "$datefrom",
        "Datato": "$dateto"
      }
    };
    final response = await http.put(
      myUrl,
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

  void addDataIdea(String ideaTitle, String managementType, String ideaCategory, String address, String funding, String ideaDescription) async {

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

  Future<List> getDataIdeaHome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/Ideahome";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    return json.decode(response.body);
  }

  Future<List> getAllJobData() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    String myUrl = "https://successsroadv2.herokuapp.com/api/v1/Jobhome";
    http.Response response = await http.get(myUrl, headers: {
      //'Accept':'*/*',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  void editDataIdea(int id, String ideaTitle, String managementType, String ideaCategory, String address, String funding, String ideaDescription) async {

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

  void editDataJobs(int id, String jobTitle, String jobType, String jobCategory, String address, String salary, String gander,String qualification, String experience, String description) async {
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
      "qualification": "$qualification",
      "experience": "$experience",
      "description": "$description"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  Future<List<dynamic>> getCurrentUserJobs() async {
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
    print(response.body);
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

  /*_save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'auth_token';
    final value = token;
    prefs.setString(key, value);
  }*/

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'auth_token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}

logout() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove('auth_token');
}