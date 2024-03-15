import 'package:carconnect/Constants/auth_api.dart';
import 'package:carconnect/models/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class AvailableRides extends StatefulWidget {
  final double? lat;
  final double? long;
  const AvailableRides({super.key, this.lat, this.long});

  @override
  // ignore: no_logic_in_create_state, unnecessary_this
  State<AvailableRides> createState() => _AvailableRidesState();
}

class _AvailableRidesState extends State<AvailableRides> {
  String locationMessage = "New available";
  double? lat;
  double? long;
  List<Request> myreq = [];
  bool isLoading = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 10);

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude;
      long = position.longitude;
      setState(() {
        locationMessage = "longitude: $long, latitude: $lat";
      });
    });
    print(locationMessage);
  }

  Future<void> availARide() async {
    final url = Uri.parse("$api/api/createreq/");
    final response = await http.post(
      url,
      body: {
        'user': usernameController.text,
        'presenet_loc_longitude': long.toString(),
        'presenet_loc_latitude': lat.toString(),
        'destination_address': destinationController.text,
      },
    );

    if (response.statusCode == 200) {
      // Request successful
      print('Request made successfully');
    } else {
      // Request failed
      print('Failed to make request. Status code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _liveLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
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
            const SizedBox(height: 200),
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
                    labelText: 'Username',
                    hintStyle: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        color: Color.fromARGB(255, 134, 85, 85))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: destinationController,
                obscureText: false,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Destination Location',
                    hintStyle: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        color: Color.fromARGB(255, 134, 85, 85))),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            ElevatedButton(
              onPressed: availARide,
              child: const Text("Avail A Ride"),
            )
          ],
        )),
      ),
    );
  }
}
