import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0.0;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
      ),
      body: Center(
          child: Container(
        constraints: BoxConstraints(
          maxWidth: 640.0,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _calculate();
                        },
                        decoration: const InputDecoration(
                          labelText: '身高(cm)',
                          hintText: '請輸入身高',
                        ),
                      ),
                      TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _calculate();
                        },
                        decoration: const InputDecoration(
                          labelText: '體重(kg)',
                          hintText: '請輸入體重',
                        ),
                      ),
                    ]))),
            const SizedBox(height: 16.0),
            Offstage(
              offstage: _result.isEmpty,
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.center,
                children: [
                  Chip(label: Text('BMI: ${_bmi.toStringAsFixed(2)}')),
                  Chip(label: Text('$_result')),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void _calculate() {
    if (_heightController.text.isEmpty || _weightController.text.isEmpty) {
      setState(() {
        _bmi = 0.0;
        _result = '';
      });
      return;
    }
    final double height = double.parse(_heightController.text) / 100;
    final double weight = double.parse(_weightController.text);
    setState(() {
      _bmi = weight / (height * height);
      if (_bmi < 18.5) {
        _result = '過輕';
      } else if (_bmi >= 18.5 && _bmi < 24.9) {
        _result = '正常';
      } else if (_bmi >= 24.9 && _bmi < 29.9) {
        _result = '過重';
      } else if (_bmi >= 29.9 && _bmi < 34.9) {
        _result = '肥胖';
      } else if (_bmi >= 34.9 && _bmi < 100) {
        _result = '非常肥胖';
      } else if (_bmi >= 100) {
        _result = '胖到走路可能要用滾的';
      }
    });
  }
}
