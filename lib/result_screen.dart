import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Student Result',
          style: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            _buildHeaderRow(),

            const Divider(thickness: 2, color: Colors.blueAccent),

            _buildResultRow('English', '100', '85', '85%', 'A'),
            _buildResultRow('Urdu', '100', '78', '78%', 'B'),
            _buildResultRow('Math', '100', '92', '92%', 'A+'),
            _buildResultRow('Science', '100', '88', '88%', 'A'),

            const SizedBox(height: 30),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Overall Grade: A',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _headerText('Subject'),
        _headerText('Course Marks'),
        _headerText('Obtained Marks'),
        _headerText('Percentage'),
        _headerText('Grade'),
      ],
    );
  }

  Widget _buildResultRow(String subject, String courseMarks, String obtainedMarks, String percentage, String grade) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _resultText(subject),
          _resultText(courseMarks),
          _resultText(obtainedMarks),
          _resultText(percentage),
          _resultText(grade),
        ],
      ),
    );
  }

  Widget _headerText(String text) {
    return Expanded(
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _resultText(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}