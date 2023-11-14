import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentid;
  const GetUserName({super.key, required this.documentid});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentid).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData && snapshot.data!.data() != null){
              Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['Name']}',style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 18),);
            }
          }
          return const Text('loading...');
        }));
  }
}
