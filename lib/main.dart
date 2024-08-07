import 'package:flutter/material.dart';
import 'package:flutter_application/piechart.dart';
import 'package:flutter_application/urination.dart';
import 'incontinence.dart';
import 'intake.dart';
import 'login.dart';
import 'mainscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/intake': (context) => IntakeScreen(),
        '/incontinence': (context) => IncontinenceScreen(),
        '/urination': (context) => UrinationScreen(),
        '/pie_chart': (context) => PieChartScreen(),
      },
    );
  }
}
