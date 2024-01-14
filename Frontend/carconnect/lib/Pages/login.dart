import 'dart:convert';

import 'package:carconnect/Constants/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  logIn(
      {String username = "",
      String password = "",
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(Uri.parse("${api}api/signin/"),
          headers: <String, String>{
            'content-type': 'application/json; charset=utf-8'
          },
          body: jsonEncode(
              <String, dynamic>{'username': username, 'password': password}));
      if (response.statusCode == 201) {
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.purple, Colors.blueAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          )),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Please Enter You LogIn Details...",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.acme(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                // UserName
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: usernameController,
                    obscureText: false,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'UserName',
                        hintStyle: TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            color: Color.fromARGB(255, 134, 85, 85))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Password
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Password',
                        hintStyle: TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            color: Color.fromARGB(255, 134, 85, 85))),
                  ),
                ),
                // Button
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 45,
                  padding: const EdgeInsets.only(left: 60),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      logIn(
                        username: usernameController.text,
                        password: passwordController.text,
                        context: context,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.account_circle,
                            color: Colors.black,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            'LogIn',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
