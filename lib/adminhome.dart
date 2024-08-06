import 'package:flutter/material.dart';


class AdminHomeRoute extends StatefulWidget{
  const AdminHomeRoute({super.key});

  @override
  State<AdminHomeRoute> createState()=> _AdminHomeRouteState();
}
class _AdminHomeRouteState extends State<AdminHomeRoute> {


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin',
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