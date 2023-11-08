import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_system/components/get_user_mail.dart';
import 'package:smart_parking_system/components/get_user_name.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  List<String> docIDs = [];

  Future getdocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              docIDs.add(element.reference.id);
            }));
  }

  String userId = FirebaseAuth.instance.currentUser!.uid;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('PROFILE'),
        leading: null,
      ),
      body: Column(children: [
        Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/woman2.jpg'),
                radius: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder(
                    future: getdocId(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return GetUserName(documentid: userId);
                    },
                  ),
                  FutureBuilder(
                    future: getdocId(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return GetUserMail(documentid: userId);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 20),
                        backgroundColor:
                            const Color.fromARGB(255, 230, 206, 91)),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(children: const [
              Icon(
                Icons.wallet,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Wallet',
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ]),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'vehicleroute');
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.car_rental,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Vehicles',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(children: const [
              Icon(
                Icons.language,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Language',
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ]),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(children: const [
              Icon(
                Icons.help,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Help and Support',
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ]),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Terms and Conditions',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(children: const [
              Icon(
                Icons.privacy_tip_outlined,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ]),
          ),
        ),
        ElevatedButton(
          onPressed: signUserOut,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
