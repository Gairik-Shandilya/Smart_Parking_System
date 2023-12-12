import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
User? user = FirebaseAuth.instance.currentUser;

Future<void> addTableData() async {
  try {
    // Reference to the main collection
    CollectionReference mainCollection = FirebaseFirestore.instance.collection('users');
    DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd MM yyyy').format(now);
  String formattedTime = DateFormat('HH mm ss').format(now);
    // Reference to the nested collection
    DocumentReference nestedCollection = mainCollection.doc(user!.uid).collection('nested_collection').doc(formattedDate);

    // Get the current date and time
    

    // Define the data to be added to the document
    Map<String, dynamic> entryData = {
      'date': formattedDate,
      'entry_time': formattedTime,
      'exit_time': null, // You can set the exit_time initially to null
      'status': 'Correct',     // Assuming 'In' is the initial status
    };

    // Add the data to Firestore
    await nestedCollection.set(entryData);

    print('New entry added successfully!');
  } catch (e) {
    print('Error adding new entry: $e');
  }
}
