import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'dataentry.dart';

class UrinationScreen extends StatefulWidget {
  @override
  _UrinationScreenState createState() => _UrinationScreenState();
}

class _UrinationScreenState extends State<UrinationScreen> {
  final _litersController = TextEditingController();
  final _remarksController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Urination Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
          'Intake Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 20,),

            TextField(
              controller: _litersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Liters'),
            ),
            TextField(
              controller: _remarksController,
              decoration: InputDecoration(labelText: 'Remarks'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                  },
                ),
              ),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Time',
                suffixIcon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      _timeController.text = pickedTime.format(context);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final liters = double.tryParse(_litersController.text) ?? 0.0;
                final remarks = _remarksController.text;
                final dateTime = '${_dateController.text} ${_timeController.text}';

                final entry = DataEntry(
                  id: 100 +  Random().nextInt(900),
                  type: 'Urination',
                  liters: liters,
                  dateTime: dateTime,
                  remarks: remarks,
                );

                await _dbHelper.insertDataEntry(entry);
                Navigator.pop(context);
              },
              child: const Text('Update'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
