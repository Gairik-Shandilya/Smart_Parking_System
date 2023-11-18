import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final GlobalKey globalKey = GlobalKey();
  late String dataForCurrentUser;
  bool _mounted = false;
  String qr_data = "";

  @override
  void initState() {
    super.initState();
    _mounted = true;
    fetchDataForCurrentUser();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> fetchDataForCurrentUser() async {
    try {
      // Get the current user from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Replace 'your_collection' with your Firestore collection name
        // Replace 'uid' with the actual UID field in your Firestore documents
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Assuming you want to retrieve the value from the 'field_name' field
        dataForCurrentUser = userSnapshot['VehicleNo'].toString();
        if(_mounted){
          setState(() {
            qr_data = dataForCurrentUser;
        });
        }
        
        // Print the data for verification (you can remove this line in your final code)
        print('Data for current user: $dataForCurrentUser');
      } else {
        // Handle the case where there is no current user
        print('No current user');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle the error, e.g., display an error message
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Generate QR Code'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: qr_data.isEmpty
                      ? const Text(
                          "Enter Data to Generate QR Code",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        )
                      : QrImage(
                          data: qr_data,
                          version: QrVersions.auto,
                          size: 200,
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
