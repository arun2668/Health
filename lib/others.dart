// import 'package:flutter/material.dart';
// import 'database_helper.dart';
// import 'dataentry.dart';
//
// class SomeScreen extends StatefulWidget {
//   @override
//   _SomeScreenState createState() => _SomeScreenState();
// }
//
// class _SomeScreenState extends State<SomeScreen> {
//   final DatabaseHelper _dbHelper = DatabaseHelper(); // Use the factory constructor
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Some Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             // Example of inserting a new entry
//             DataEntry entry = DataEntry(
//               id: 0,
//               type: 'Intake',
//               liters: 1.5,
//               dateTime: '2024-08-07 12:00',
//               remarks: 'Sample remark',
//             );
//             await _dbHelper.insertDataEntry(entry);
//
//             // Example of fetching entries
//             List<DataEntry> entries = await _dbHelper.getDataEntries();
//             print(entries);
//           },
//           child: Text('Perform DB Operation'),
//         ),
//       ),
//     );
//   }
// }
