import 'package:flutter/material.dart';
import 'dart:async';

class HandspeedPage extends StatefulWidget {
  const HandspeedPage({super.key});

  @override
  State<HandspeedPage> createState() => _HandspeedPageState();
}

class _HandspeedPageState extends State<HandspeedPage> {
  int counter = 0, maxcounter = 0;
  double speed = 0.0;
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
                  child: Text("快速的點擊我吧",
                      style: TextStyle(fontSize: 30.0)),
                  onPressed: () {
                    setState(() {
                      if (counter == 0) {
                        counter++;
                        Timer(Duration(seconds: 5), () {
                          counter = -1;
                        });
                      } else if (counter > 0) {
                        counter++;
                      }
                      if (counter >= maxcounter) {
                          maxcounter = counter;
                          speed = (5 / maxcounter);
                        }
                    });
                  },
                ),
                ),
                const SizedBox(height: 16.0),
                if (counter == -1)
                  ElevatedButton(
                    child: Text("重新開始",
                        style: TextStyle(fontSize: 24.0)),
                    onPressed: () {
                      setState(() {
                        counter = 0;
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
                        label: Text('最快平均${speed.toStringAsFixed(4)}秒/次',
                            style: TextStyle(fontSize: 24.0))),
                  ],
                ),
              ],
            ),
            )
            
          ),
        ));
  }
}
