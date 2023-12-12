// class Data {
//   String _date;
//   String _entrytime;
//   String _exittime;
//   String _status;

//   Data.entry(this._date, this._entrytime, this._status, this._exittime);
//   Data.exit(this._date, this._entrytime, this._status, this._exittime);

//   String get date => _date;
//   String get entrytime => _entrytime;
//   String get status => _status;
//   String get exittime => _exittime;

//   set date(String newdate) {
//     this._date = newdate;
//   }

//   set entrytime(String newentrytime) {
//     this._date = newentrytime;
//   }

//   set status(String newstatus) {
//     this._date = newstatus;
//   }

//   set exittime(String newexittime) {
//     this._date = newexittime;
//   }

//   Map<String, dynamic> toMap() {
//     var map = Map<String, dynamic>();
//     map['date'] = _date;
//     map['entrytime'] = _entrytime;
//     map['status'] = _status;
//     map['exittime'] = _exittime;
//     return map;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_parking_system/pages/home_page.dart';
User? user = FirebaseAuth.instance.currentUser;

Future<List<DataEntry>> getTableData() async {
  // Reference to the main collection
  CollectionReference mainCollection = FirebaseFirestore.instance.collection('users');
  // Reference to the nested collection
  CollectionReference nestedCollection = mainCollection.doc(user!.uid).collection('nestedcollection');
  // Get documents from the nested collection
  QuerySnapshot nestedCollectionSnapshot = await nestedCollection.get();
  
  // Create a list to store DataEntry objects
  List<DataEntry> entries = [];

  // Iterate through documents and access fields
  nestedCollectionSnapshot.docs.forEach((DocumentSnapshot document) {
    Map<String, dynamic> map = document.data() as Map<String, dynamic>;
    // Access fields
    String _date = map['Date'];
    String _entrytime = map['Entry Time'];
    String _exittime = map['Exit Time'];
    String _status = map['Status'];

    // Create a DataEntry object and add it to the list
    DataEntry entry = DataEntry(
      date: _date,
      entryTime: _entrytime,
      exitTime: _exittime,
      status: _status,
    );
    
    entries.add(entry);
  });

  return entries;
}
