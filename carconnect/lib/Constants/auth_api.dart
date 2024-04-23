import 'dart:convert';
import 'package:carconnect/models/models.dart';
// import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:carconnect/Constants/constants.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';

// const String api = "http://192.168.105.89:8000";
const String api = "http://13.201.66.6";

Future<dynamic> userAuth(String username, String password, context) async {
  Map body = {
    "username": username,
    // "email": "",
    "password": password,
  };
  var url = Uri.parse("$api/dj-rest-auth/login/");
  var res = await http.post(url, body: body);
  if (res.statusCode == 200) {
    try {
      await Hive.initFlutter();

      Map json = jsonDecode(res.body);
      String token = json["key"];

      // Open the box after initializing Hive
      var box = await Hive.openBox(tokenBox);
      box.put("token", token);
      await getUser(token);
      User? user = await getUser(token);

      return user;
    } catch (e) {
      print("problem $e");
    }
    
  } else {
    return null;
  }
}

Future<http.Response> getUserDet(id) async {
  var url = Uri.parse("$api/api/getData/?id=$id");
  var resp = await http.get(url);
  return resp;
}

Future<User?> getUser(String token) async {
  var url = Uri.parse("$api/dj-rest-auth/user/");
  print(token);
  var resp = await http.get(url, headers: {
    "Authorization": "Token $token",
  });
  print(resp.body);
  if (resp.statusCode == 200) {
    var json = jsonDecode(resp.body);
    http.Response response = await getUserDet(json["pk"]);
    var json2 = jsonDecode(response.body);
    User user = User.fromJson(json2);
    user.token = token;
    return user;
  } else {
    return null;
  }
}
