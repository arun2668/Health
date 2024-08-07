import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'database_helper.dart';
import 'dataentry.dart';

class PieChartScreen extends StatefulWidget {
  @override
  _PieChartScreenState createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  double intake = 0.0;
  double urination = 0.0;
  int incontinenceCount = 0;

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // Define a list of colors to use in the pie chart
  final List<Color> _colors = [Colors.blue, Colors.red, Colors.green];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final entries = await _dbHelper.getDataEntries();
    double intakeTotal = 0.0;
    double urinationTotal = 0.0;
    int incontinenceTotal = 0;

    for (var entry in entries) {
      if (entry.type == 'Intake') {
        intakeTotal += entry.liters;
      } else if (entry.type == 'Urination') {
        urinationTotal += entry.liters;
      } else if (entry.type == 'Incontinence') {
        incontinenceTotal += 1; // Count the number of incontinence entries
      }
    }

    setState(() {
      intake = intakeTotal;
      urination = urinationTotal;
      incontinenceCount = incontinenceTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'Data Summary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100), // Space between text and pie chart
              Container(
                height: 300, // Adjust this height to make the pie chart larger
                child: PieChart(
                  PieChartData(
                    sections: _buildPieChartSections(),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 2,
                    centerSpaceRadius: 70, // Adjust to fit the larger pie chart
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    List<PieChartSectionData> sections = [];
    List<double> values = [intake, incontinenceCount.toDouble(), urination];
    List<String> titles = [
      'Intake: ${intake.toStringAsFixed(1)}L',
      'Incontinence: $incontinenceCount',
      'Urination: ${urination.toStringAsFixed(1)}L'
    ];

    for (int i = 0; i < values.length; i++) {
      if (values[i] > 0) {
        sections.add(
          PieChartSectionData(
            color: _colors[i % _colors.length],
            value: values[i],
            title: titles[i],
            radius: 100, // Increase the radius for a larger pie chart
            titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        );
      }
    }

    return sections;
  }
}
