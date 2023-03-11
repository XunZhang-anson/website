import 'package:flutter/material.dart';
import 'dart:async';

class HandspeedPage extends StatefulWidget {
  const HandspeedPage({super.key});

  @override
  State<HandspeedPage> createState() => _HandspeedPageState();
}

class _HandspeedPageState extends State<HandspeedPage> {
  int counter = 0, maxcounter = 0;
  bool isStart = false, isComplete = false;
  double speed = 0.0;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Handspeed'),
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
                    child: Image.asset('assets/images/handspeedimage.png',
                        width: 300, height: 300)),
                const SizedBox(height: 16.0),
                const Text('5秒鐘你能點多快', style: TextStyle(fontSize: 30.0)),
                const SizedBox(height: 32.0),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: Text("快速的點擊我吧", style: TextStyle(fontSize: 30.0)),
                    onPressed: isComplete
                        ? null
                        : () {
                            if (!isStart || !isComplete) {
                              isStart = true;
                              setState(() {
                                timer = Timer(Duration(seconds: 5), () {
                                  isComplete = true;
                                  isStart = false;
                                });
                              });
                            }
                            setState(() {
                              counter++;
                              speed = (5 / counter);
                            });
                            if (counter >= maxcounter) {
                              maxcounter = counter;
                            }
                          },
                  ),
                ),
                const SizedBox(height: 16.0),
                if (isComplete)
                  ElevatedButton(
                    child: Text("重新開始", style: TextStyle(fontSize: 24.0)),
                    onPressed: () {
                      setState(() {
                        counter = 0;
                        isComplete = false;
                      });
                    },
                  ),
                const SizedBox(height: 32.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    Chip(
                        label: Text('目前${counter}次',
                            style: TextStyle(fontSize: 24.0))),
                    Chip(
                        label: Text('最多${maxcounter}次',
                            style: TextStyle(fontSize: 24.0))),
                    Chip(
                        label: Text('平均${speed.toStringAsFixed(4)}秒/次',
                            style: TextStyle(fontSize: 24.0))),
                  ],
                ),
              ],
            ),
          )),
        ));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
