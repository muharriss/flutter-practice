import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double _numberFrom;
  late String _startMeasure;
  late String _convertedMeasure;
  String _resultMessage = "";
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  final Map<String, int> _measureMap = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };

  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

  final TextStyle inputStyle = const TextStyle(
    fontSize: 20,
    color: Colors.indigo,
  );
  final TextStyle labelStyle = const TextStyle(
    fontSize: 24,
    color: Colors.blueAccent,
  );

  @override
  void initState() {
    _numberFrom = 0;
    _startMeasure = _measures[0];
    _convertedMeasure = _measures[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Unit Converter'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Value',
                  style: labelStyle,
                ),
                const SizedBox(height: 10),
                TextField(
                  style: inputStyle,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan sebuah angka',
                  ),
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
                      setState(() {
                        _numberFrom = rv;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'From',
                  style: labelStyle,
                ),
                const SizedBox(height: 10),
                DropdownButton(
                  isExpanded: true,
                  style: inputStyle,
                  items: _measures
                      .map((String value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  value: _startMeasure,
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'To',
                  style: labelStyle,
                ),
                const SizedBox(height: 10),
                DropdownButton(
                  isExpanded: true,
                  style: inputStyle,
                  items: _measures
                      .map((String value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  value: _convertedMeasure,
                  onChanged: (value) {
                    setState(() {
                      _convertedMeasure = value!;
                    });
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    _convert(_numberFrom, _startMeasure, _convertedMeasure);
                  },
                  child: const Text('Convert'),
                ),
                const SizedBox(height: 10),
                Text(
                  _resultMessage,
                  style: labelStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _convert(double value, String from, String to) {
    int fromIndex = _measureMap[from]!;
    int toIndex = _measureMap[to]!;
    var multiplier = _formulas[fromIndex.toString()][toIndex];
    double result = value * multiplier;

    setState(() {

     multiplier ==0 ? _resultMessage = "Connot convert" :  _resultMessage = "$value $from = $result $to";
    });
  }
}
