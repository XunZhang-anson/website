import 'package:flutter/material.dart';
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
                Text('隨機數字產生器', style: TextStyle(fontSize: 30.0)),
                const SizedBox(height: 32.0),
                
                SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: Text("點擊產生隨機數字", style: TextStyle(fontSize: 30.0)),
                    onPressed: () {
                      setState(() {
                        number = Random().nextInt(100);
                      });
                    },
                  ),
                ),
                Wrap(
                  children: [
                    Text('隨機數字為：$number', style: TextStyle(fontSize: 30.0)),
                  ],
                ),
              ]
            )
          )
        )
      )
    );
  }
}
