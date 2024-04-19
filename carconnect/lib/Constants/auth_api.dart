import 'dart:convert';
import 'package:carconnect/models/models.dart';
import 'package:hive/hive.dart';
import 'package:carconnect/Constants/constants.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

// const String api = 'http://192.168.121.23:8000';

const String api = "http://15.206.179.110";

// const String api = 'http://127.0.0.1:8000';
// const String api = 'https://carconnectbackend.onrender.com';

Future<dynamic> userAuth(String username, String password, context) async {
  Map body = {
    "username": username,
    // "email": "",
    "password": password,
  };
  var url = Uri.parse("$api/dj-rest-auth/login/");
  var res = await http.post(url, body: body);

  print("Body ${res.body}");
  print("Res1 ${res.statusCode}");
  if (res.statusCode == 200) {
    try {
      // Initialize Hive
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

Future<User?> getUser(String token) async {
  var url = Uri.parse("$api/dj-rest-auth/user/");
  print(token);
  var resp = await http.get(url, headers: {
    "Authorization": "Token $token",
  });
  print(resp.body);
  if (resp.statusCode == 200) {
    var json = jsonDecode(resp.body);
    User user = User.fromJson(json);
    user.token = token;
    return user;
  } else {
    return null;
  }
}
