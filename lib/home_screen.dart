import 'package:flutter/material.dart';
import 'package:task3/result_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String selectedOperation = 'Addition';
  double result = 0;

  void calculateResult() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    switch (selectedOperation) {
      case 'Addition':
        result = num1 + num2;
        break;
      case 'Subtraction':
        result = num1 - num2;
        break;
      case 'Multiplication':
        result = num1 * num2;
        break;
      case 'Division':
        result = num2 != 0 ? num1 / num2 : double.nan;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 150, left: 15),
          children: [
            _buildDrawerItem('Calculator', () => Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen()))),
            _buildDrawerItem('Result Screen', () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
            }),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Calculator', style: TextStyle(color: Colors.white, letterSpacing: 5)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberField(num1Controller, 'Enter First Number'),
            const SizedBox(height: 15),
            _buildNumberField(num2Controller, 'Enter Second Number'),
            const SizedBox(height: 15),
            _buildOperationDropdown(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResult,
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Text('Result: $result', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: const TextStyle(color: Colors.blue, fontSize: 22)),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildOperationDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedOperation,
        isExpanded: true,
        underline: const SizedBox(),
        items: ['Addition', 'Subtraction', 'Multiplication', 'Division'].map((operation) =>
            DropdownMenuItem(value: operation, child: Text(operation))
        ).toList(),
        onChanged: (newValue) => setState(() => selectedOperation = newValue!),
      ),
    );
  }
}
