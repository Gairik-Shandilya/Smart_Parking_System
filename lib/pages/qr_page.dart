import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final GlobalKey globalKey = GlobalKey();
  // ignore: non_constant_identifier_names
  String qr_data = " ";
  @override
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Enter Data", border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    qr_data = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
