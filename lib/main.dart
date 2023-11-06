import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_parking_system/auth/auth.dart';
import 'package:smart_parking_system/pages/profile_page.dart';
import 'package:smart_parking_system/pages/vehicles.dart';
import 'firebase_options.dart';

void main() async {

WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "vehicleroute":(context)=>const Vehicle(),
        "profilepage":(context)=>const ProfilePage()
      },
      home: const AuthPage(),
    );
  }
}
