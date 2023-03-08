import 'package:flutter/material.dart';

class SpeedPage extends StatefulWidget {
  const SpeedPage({super.key});

  @override
  State<SpeedPage> createState() => _SpeedPageState();
}

class _SpeedPageState extends State<SpeedPage> {
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  double _speed = 0.0;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _distanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Distance(m)',
                hintText: 'Please enter distance',
              ),
            ),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Time(s)',
                hintText: 'Please enter time',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16.0),
            Text('Speed: $_speed'),
            Text('$_result'),
          ],
        ),
      ),
    );
  }

  void _calculate() {
    final double distance = double.parse(_distanceController.text);
    final double time = double.parse(_timeController.text);
    setState(() {
      _speed = distance / time;
      if (_speed < 1) {
        _result = 'Too slow';
      } else if (_speed < 3) {
        _result = 'Normal';
      } else {
        _result = 'Too fast';
      }
    });
  }
}
