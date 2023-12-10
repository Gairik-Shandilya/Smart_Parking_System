import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:intl/intl.dart';
import 'package:smart_parking_system/pages/home_page.dart';

class QrScaner extends StatefulWidget {
  const QrScaner({super.key});

  @override
  State<QrScaner> createState() => _QrScanerState();
}

class _QrScanerState extends State<QrScaner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedcode = '';
  late String dataForCurrentUser;
  bool _mounted = false;
  bool isverified = false;
  late DateTime currenttime;

  @override
  void initState() {
    super.initState();
    _mounted = true;
    isverified = false;
    checkDataForCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    _mounted = false;
  }

  Future<void> checkDataForCurrentUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        dataForCurrentUser = userSnapshot['VehicleNo'].toString();
      } else {}
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Scan QR Code'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Place the QR code in the area",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Scanning will be started automatically",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                )
              ],
            )),
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.blue,
                        borderRadius: 10,
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: Center(
              child: Text(
                'Scanned result : $isverified',
                style: const TextStyle(fontSize: 18),
              ),
            )),
            Visibility(
                visible: isverified,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Yes it is your place. Do you wish to park?',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              HomePage();
                              setState(() {
                                currenttime = DateTime.now();
                              });
                            },
                            child: Text('Yes'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle the "No" choice
                              print('User selected No');
                            },
                            child: Text('No'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedcode = scanData.code!;

        if (scannedcode == dataForCurrentUser) {
          isverified = true;
          print('HENCE VERIFIED');
        }
      });
    });
  }
}
