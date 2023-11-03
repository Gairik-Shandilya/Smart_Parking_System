import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_system/pages/home_page.dart';
import 'package:smart_parking_system/pages/profile_page.dart';
import 'package:smart_parking_system/pages/qr_code_scanner.dart';
import 'package:smart_parking_system/pages/qr_page.dart';
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final user = FirebaseAuth.instance.currentUser!;

  

  @override
  int _currentIndex = 0;

  List <Widget> tabs = const <Widget> [
    HomePage(),
    QrPage(),
    QrScaner(),
    ProfilePage()
  ];

  Widget build(BuildContext context) {

    return 
    SafeArea(
      child: Scaffold(
        
    
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: 'QR',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'SCANNER',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'PROFILE',
                backgroundColor: Colors.black),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
