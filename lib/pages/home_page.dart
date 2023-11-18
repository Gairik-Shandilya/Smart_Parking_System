import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Parking System'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Container(
          // child: Table(  
          //           defaultColumnWidth: FixedColumnWidth(120.0),  
          //           border: TableBorder.all(  
          //               color: Colors.black,  
          //               style: BorderStyle.solid,  
          //               width: 2),  
          //           children: [  
          //             TableRow( children: [  
          //               Column(children:[Text('Date', style: TextStyle(fontSize: 20.0))]),  
          //               Column(children:[Text('Entry', style: TextStyle(fontSize: 20.0))]),  
          //               Column(children:[Text('Exit', style: TextStyle(fontSize: 20.0))]),  
                        
          //             ]),  
          //             TableRow( children: [  
          //               Column(children:[Text('15/11/2023')]),  
          //               Column(children:[Text('12:00')]),  
          //               Column(children:[Text('2:00')]),  
                        
          //             ]),  
          //             TableRow( children: [  
          //               Column(children:[Text('16/11/2023')]), 
          //               Column(children:[Text('8:00')]),  
          //               Column(children:[Text('11:00')]),  
                         
          //             ]),  
          //             TableRow( children: [  
          //               Column(children:[Text('17/11/2023')]),  
          //               Column(children:[Text('9:00')]),  
          //               Column(children:[Text('15:00')]),  
                        
          //             ]),  
          //           ],  
          //         ),  
          child:  DataTable(columns: const [
            DataColumn(label: Text('Date',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),)),
            DataColumn(label: Text('Entry',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),)),
            DataColumn(label: Text('Exit',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),)),
            DataColumn(label: Text('Status',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),)),
          ],
          rows:const [  
                DataRow(cells: [  
                  DataCell(Text('15/11/2023')),  
                  DataCell(Text('8:00')),  
                  DataCell(Text('12:00')),
                  DataCell(Text('Correct')),    
                ]),  
                DataRow(cells: [  
                  DataCell(Text('16/11/2023')),  
                  DataCell(Text('9:00')),  
                  DataCell(Text('13:00')),
                  DataCell(Text('Correct')),    
                ]),  
                DataRow(cells: [  
                  DataCell(Text('17/11/2023')),  
                  DataCell(Text('8:30')),  
                  DataCell(Text('16:00')),
                  DataCell(Text('Wrong')),    
                ]),  
                DataRow(cells: [  
                  DataCell(Text('18/11/2023')),  
                  DataCell(Text('11:00')),  
                  DataCell(Text('15:00')),
                  DataCell(Text('Wrong')),    
                ]),  
              ],  
          ),
        ),
      ),
    );
  }
}
