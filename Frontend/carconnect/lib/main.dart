import 'package:flutter/material.dart';
import 'package:carconnect/Pages/welcomepage.dart';
// import 'package:carconnect/theme/colors.dart' as colors;
// import 'package:carconnect/theme/theme_modal.dart';

void main() {
  runApp(const CarConnect());
}

class CarConnect extends StatefulWidget {
  const CarConnect({super.key});

  @override
  State<CarConnect> createState() => _CarConnectState();
}

class _CarConnectState extends State<CarConnect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sage',
      theme: ThemeData(
        // useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 32, 5, 152),
      ),
      home: const WelcomePage(),
    );
  }
}
