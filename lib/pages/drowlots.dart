/*import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class drowlotsPage extends StatefulWidget {
  const drowlotsPage({super.key});

  @override
  State<drowlotsPage> createState() => _drowlotsPageState();
}

class _drowlotsPageState extends State<drowlotsPage> {
  int number = 0, value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('drowlots'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
        constraints: BoxConstraints(
          maxWidth: 640.0,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(' '),
            Card(
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                      TextField(
                        
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _calculate();
                        },
                        decoration: const InputDecoration(
                          hintText: '請輸入號碼',
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
                  Chip(label: Text('BMI: ${_bmi.toStringAsFixed(2)}',style: TextStyle(fontSize: 24.0))),
                  Chip(label: Text('$_result',style: TextStyle(fontSize: 24.0))),
                ],
              ),
            )
          ],
        ),
      )),
      )
    );
  }
}*/
