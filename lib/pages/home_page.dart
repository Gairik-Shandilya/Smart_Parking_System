import 'package:flutter/material.dart';
import 'package:smart_parking_system/components/gettabledata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class DataEntry {
  final String date;
  final String entryTime;
  final String exitTime;
  final String status;

  DataEntry({
    required this.date,
    required this.entryTime,
    required this.exitTime,
    required this.status,
  });
}


class _HomePageState extends State<HomePage> {
  List<DataEntry> dataEntries = [];
  void _handleParkingChoice(bool isCorrect, DateTime entryTime) {
  DataEntry newEntry = DataEntry(
    date: entryTime.toLocal().toString(), // Convert to local time if needed
    entryTime: entryTime.toLocal().toString(),
    exitTime: 'New Exit Time',
    status: isCorrect ? 'Correct' : 'Wrong',
  );
  setState(() {
    dataEntries.add(newEntry);
  });
}
  @override
  void initState() {
    super.initState();
    // Call getTableData when the widget is initialized
    fetchData();
  }
  Future<void> fetchData() async {
    List<DataEntry> entries = await getTableData();
    setState(() {
      dataEntries = entries;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Parking System'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Container(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Entry', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Exit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: dataEntries
                .map(
                  (entry) => DataRow(
                    cells: [
                      DataCell(Text(entry.date)),
                      DataCell(Text(entry.entryTime)),
                      DataCell(Text(entry.exitTime)),
                      DataCell(Text(entry.status)),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new entry to the dataEntries list
          DataEntry newEntry = DataEntry(
            date: 'New Date',
            entryTime: 'New Entry Time',
            exitTime: 'New Exit Time',
            status: 'New Status',
          );
          setState(() {
            dataEntries.add(newEntry);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


