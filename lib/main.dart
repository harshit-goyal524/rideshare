import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './uihelp.dart';
import './companionhome.dart';
import './adminhome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './travellerhome.dart';

Future<void> main() async {
  runApp(const MaterialApp(
    title: 'RideShare',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 150),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                child: const Text(
                  '(Select an option)',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20),
                )
              ),
              UIHelper.largeElevatedButton(
                  text: "Passenger",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TravellerHomeRoute()),
                    );
                  }),
              UIHelper.largeElevatedButton(
                  text: "Companion",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CompanionHomeRoute()),
                    );
                  }),
              UIHelper.largeElevatedButton(
                  text: "Admin",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminHomeRoute()),
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
