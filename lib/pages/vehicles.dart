import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({super.key});

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  final String documentid= FirebaseAuth.instance.currentUser!.uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                const CircleAvatar(
                backgroundImage: AssetImage('assets/audi.png'),
                radius: 80,
              
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Vehicle Name : ',style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18)),
                  FutureBuilder<DocumentSnapshot>(
                  future: users.doc(documentid).get(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if(snapshot.hasData && snapshot.data!.data() != null){
                        Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Text('${data['VehicleName']}',style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18),);
                      }
                    }
                    return const Text('loading...');
                  })),
                ],
              ),
              
              const SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Vehicle No : ',style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18)),
                  FutureBuilder<DocumentSnapshot>(
                  future: users.doc(documentid).get(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if(snapshot.hasData && snapshot.data!.data() != null){
                        Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Text('${data['VehicleNo']}',style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18),);
                      }
                    }
                    return const Text('loading...');
                  })),
                ],
              ),
              ],),
              
              
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    backgroundColor: const Color.fromARGB(255, 230, 206, 91)),
                child:  const Center(
                  child: Text(
                    'Add Vehicles',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
