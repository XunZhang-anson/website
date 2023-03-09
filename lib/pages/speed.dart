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
  double _speed2 = 0.0;
  /* String _result = '';*/
  String dropdownValue = '公尺';
  String dropdownValue2 = '秒';

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _distanceController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _calculate();
                    },
                    decoration: const InputDecoration(
                      labelText: '距離',
                      hintText: '請輸入距離',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                      _calculate();
                    },
                    items: <String>['公尺', '公里', '公分']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _timeController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _calculate();
                    },
                    decoration: const InputDecoration(
                      labelText: '時間',
                      hintText: '請輸入時間',
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                        _calculate();
                      },
                      items: <String>['秒', '分鐘', '小時']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
              ],
            ),
            const SizedBox(height: 16.0),
            Offstage(
                offstage: _speed == 0.0,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    Chip(
                        label: Text('${_speed.toStringAsFixed(2)}公尺/秒',
                            style: TextStyle(fontSize: 24.0))),
                    Chip(
                        label: Text('${_speed2.toStringAsFixed(2)}公里/小時',
                            style: TextStyle(fontSize: 24.0))),
                    /*Chip(
                        label:
                            Text('$_result', style: TextStyle(fontSize: 24.0))),*/
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _calculate() {
    if (_distanceController.text.isEmpty || _timeController.text.isEmpty) {
      return;
    }
    double distance = double.parse(_distanceController.text);
    double time = double.parse(_timeController.text);
    if (dropdownValue == '公里') {
      distance = distance * 1000;
    } else if (dropdownValue == '公分') {
      distance = distance / 100;
    }
    if (dropdownValue2 == '分鐘') {
      time = time * 60;
    } else if (dropdownValue2 == '小時') {
      time = time * 3600;
    }
    setState(() {
      _speed = distance / time;
      _speed2 = _speed * 3.6;
      /*if (_speed < 1) {
        _result = 'Too slow';
      } else if (_speed < 3) {
        _result = 'Normal';
      } else {
        _result = 'Too fast';
      }*/
    });
  }
}
