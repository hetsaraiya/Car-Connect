import "package:carconnect/models/models.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class Confirmation extends StatefulWidget {
  final User user;
  final String contact_number;
  final String username;
  const Confirmation(
      {super.key,
      required this.user,
      required this.contact_number,
      required this.username});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  User? user;
  String? contact_number;
  String? username;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Handle error: unable to launch the phone app
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unable to launch phone app")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                const Text(
                  "Ride Booked!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "Your ride has been booked with ${widget.username}.",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const Text(
                  "You can contact the user at:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Text(
                  // ignore: unnecessary_string_interpolations
                  "${widget.contact_number}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  "Feel free to compensate your companion rider for the ride and show appreciation for their time and effort.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    _makePhoneCall(widget.contact_number);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
