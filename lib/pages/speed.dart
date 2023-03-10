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
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/speedimage.png',
                        width: 300, height:300)),
                const SizedBox(height: 16.0),
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
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          labelText: '距離',
                          hintText: '請輸入距離',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
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
                const SizedBox(height: 16.0),
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
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          labelText: '時間',
                          hintText: '請輸入時間',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                        flex: 1,
                        child: DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
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
        )));
  }

  void _calculate() {
    if (RegExp(r'^[0-9]+$').hasMatch(_distanceController.text) == false ||
        RegExp(r'^[0-9]+$').hasMatch(_timeController.text) == false) {
      setState(() {
        _speed = 0.0;
        _speed2 = 0.0;
      });
      return;
    }
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
