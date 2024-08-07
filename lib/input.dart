// import 'package:flutter/material.dart';
// import 'package:flutter_application/piechart.dart';
// import 'package:intl/intl.dart';
// import 'database_helper.dart';
// import 'dataentry.dart';
//
// class InputScreen extends StatefulWidget {
//   final String dataType;
//
//   const InputScreen({Key? key, required this.dataType}) : super(key: key);
//
//   @override
//   _InputScreenState createState() => _InputScreenState();
// }
//
// class _InputScreenState extends State<InputScreen> {
//   final TextEditingController _litersController = TextEditingController();
//   final TextEditingController _remarksController = TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();
//   final DatabaseHelper _dbHelper = DatabaseHelper();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter ${widget.dataType} Details'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: _litersController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Liters'),
//             ),
//             TextField(
//               controller: _remarksController,
//               decoration: InputDecoration(labelText: 'Remarks'),
//             ),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(labelText: 'Date (yyyy-MM-dd)'),
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//                   setState(() {
//                     _dateController.text = formattedDate;
//                   });
//                 }
//               },
//             ),
//             TextField(
//               controller: _timeController,
//               decoration: InputDecoration(labelText: 'Time (HH:mm)'),
//               onTap: () async {
//                 TimeOfDay? pickedTime = await showTimePicker(
//                   context: context,
//                   initialTime: TimeOfDay.now(),
//                 );
//                 if (pickedTime != null) {
//                   setState(() {
//                     _timeController.text = pickedTime.format(context);
//                   });
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 String dateTime = '${_dateController.text} ${_timeController.text}';
//                 DataEntry entry = DataEntry(
//                   id: 0,
//                   type: widget.dataType,
//                   liters: double.tryParse(_litersController.text) ?? 0.0,
//                   dateTime: dateTime,
//                   remarks: _remarksController.text,
//                 );
//                 await _dbHelper.insertDataEntry(entry);
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PieChartScreen()),
//                 );
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
