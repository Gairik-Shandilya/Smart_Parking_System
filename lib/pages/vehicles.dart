import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({super.key});

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docId = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('My Vehicles'),
            backgroundColor: Colors.blueGrey,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, "profilepage");
              },
            )),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 20),
                  backgroundColor: const Color.fromARGB(255, 230, 206, 91)),
              child: const Text(
                'Add Vehicle',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            )
          ],
        ));
  }
}
