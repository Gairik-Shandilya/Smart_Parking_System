import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class GetUserVehicle extends StatefulWidget {
  const GetUserVehicle({super.key});

  @override
  State<GetUserVehicle> createState() => _GetUserVehicleState();
}

class _GetUserVehicleState extends State<GetUserVehicle> {
  late String dataFromFirestore;
  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }
   Future<void> fetchDataFromFirestore() async {
    try {
      // Replace 'your_collection' with your Firestore collection name
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      // Assuming you want to concatenate values from the 'field_name' field
      List<String> dataList = querySnapshot.docs
          .map((DocumentSnapshot document) => document['VehicleNo'].toString())
          .toList();

      // Join the list elements into a single string, separated by a delimiter (e.g., comma)
      dataFromFirestore = dataList.join(', ');

      // Print the data for verification (you can remove this line in your final code)
      print('Data from Firestore: $dataFromFirestore');
    } catch (e) {
      print('Error fetching data: $e');
      // Handle the error, e.g., display an error message
    }
  }
  Widget build(BuildContext context) {
    return Container();
  }
}