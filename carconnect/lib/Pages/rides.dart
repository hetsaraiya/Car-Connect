
import 'dart:convert';
import 'package:carconnect/Constants/auth_api.dart';
import 'package:carconnect/models/request.dart';
import 'package:http/http.dart' as http;
import 'package:carconnect/widgets/request_container.dart';
import 'package:flutter/material.dart';

class Rides extends StatefulWidget {
  const Rides({Key? key});

  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  List<Request> rides = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchRides();
  }

  Future<void> fetchRides() async {
    final url = Uri.parse(api + "/api/getridesdata/");

    try {
      final response = await http.get(url);
      var data = json.decode(response.body);
      print("requested for ride");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        data.forEach((ride) {
          Request r = Request(
            user: ride['user'],
            userlocation: ride["userlocation"],
            userDestination: ride['userDestination'],
          );
          rides.add(r);
        });

        print(rides.length);
        print(rides);
        setState(() {
          isLoading = false;
        });
      } else {
        print('Failed to fetch rides: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching rides: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
              const SizedBox(height: 20),
              const Text(
                "Rides Are Here",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView(
                      shrinkWrap: true,
                      children: rides
                          .map((e) => RequestContainer(
                                user: e.user,
                                userlocation: e.userlocation,
                                userDestination: e.userDestination,
                              ))
                          .toList(),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
