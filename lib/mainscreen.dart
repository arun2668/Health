import 'package:flutter/material.dart';
import 'package:flutter_application/piechart.dart';
import 'package:flutter_application/urination.dart';
import 'incontinence.dart';
import 'intake.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
            children: [
              const SizedBox(height: 50), // Space between heading and list items
              const Text(
                'Health Tracker Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 100), // Space between heading and list items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero, // Remove default padding
                  children: [
                    _buildListItem(
                      context,
                      Colors.blue,
                      'Intake',
                      IntakeScreen(),
                      'assets/intake.png',
                    ),
                    SizedBox(height: 20), // Space between items
                    _buildListItem(
                      context,
                      Colors.red,
                      'Incontinence',
                      IncontinenceScreen(),
                      'assets/incontinence.png',
                    ),
                    SizedBox(height: 20), // Space between items
                    _buildListItem(
                      context,
                      Colors.green,
                      'Urination',
                      UrinationScreen(),
                      'assets/urination.png',
                    ),
                    SizedBox(height: 20), // Space between items
                    _buildListItem(
                      context,
                      Colors.purple,
                      'Pie Chart',
                      PieChartScreen(),
                      'assets/pie_chart.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, Color color, String title, Widget screen, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0), // Margin for spacing from screen edges
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          backgroundImage: const AssetImage("assets/dp.jpeg"),
          radius: 30, // Size of the circle
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.start,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
