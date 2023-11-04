import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
              print(element);
              docIDs.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    getdocId();
    super.initState();
  }

  // FirebaseAuth auth = FirebaseAuth.instance;
  // late User user = auth.currentUser!;
  // late String userid = user.uid;
  // late String vehicle = user.VehicleNo;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

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
                  const Text(
                    'Esther Howard',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'test@gmail.com',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
