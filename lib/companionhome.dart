import 'package:flutter/material.dart';


class CompanionHomeRoute extends StatefulWidget{
  const CompanionHomeRoute({super.key});

  @override
  State<CompanionHomeRoute> createState()=> _CompanionHomeRouteState();
}
class _CompanionHomeRouteState extends State<CompanionHomeRoute> {


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Companion',
          style: TextStyle(
            fontSize: 20,color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: const Stack(
          children: [
            Text(
              "Enter details",
              style: TextStyle(
                fontSize: 20,color: Colors.black,
                fontWeight: FontWeight.bold,
              ),

            )
          ]
      ),
    );
  }
}