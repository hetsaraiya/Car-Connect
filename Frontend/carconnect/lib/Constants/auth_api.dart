import 'dart:convert';
import 'package:carconnect/models/models.dart';
import 'package:hive/hive.dart';
import 'package:carconnect/Constants/constants.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

const String api = 'http://180.180.3.70:8000';

Future<dynamic> userAuth(String username, String password) async {
  Map body = {
    "username": username,
    // "email": "",
    "password": password,
  };
  var url = Uri.parse("$api/dj-rest-auth/login/");
  var res = await http.post(url, body: body);

  print(res.body);
  print(res.statusCode);
  if (res.statusCode == 200) {
    Map json = jsonDecode(res.body);
    String token = json["key"];
    print(token);
    await Hive.initFlutter();
    var box = await Hive.openBox(tokenBox);
    box.put("token", token);
    await getUser(token);
    User? user = await getUser(token);
    return user;
  } else {
    Map json = jsonDecode(res.body);
    print(json);
    if (json.containsKey("username")) {
      return json["username"][0];
    }
    if (json.containsKey("password")) {
      return json["password"][0];
    }
    if (json.containsKey("non_field_errors")) {
      return json["non_field_errors"][0];
    }
  }
}

Future<User?> getUser(String token) async {
  var url = Uri.parse("$api/dj-rest-auth/user/");
  var res = await http.get(url, headers: {
    "Authorization": "Token $token",
  });
  if (res.statusCode == 200) {
    print(res.statusCode);
    var json = jsonDecode(res.body);
    User user = User.fromJson(json);
    user.token = token;
    return user;
  } else {
    return null;
  }
}
