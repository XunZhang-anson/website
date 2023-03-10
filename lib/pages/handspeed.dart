import 'package:flutter/material.dart';
import 'dart:async';

class HandspeedPage extends StatefulWidget {
  const HandspeedPage({super.key});

  @override
  State<HandspeedPage> createState() => _HandspeedPageState();
}

class _HandspeedPageState extends State<HandspeedPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handspeed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Handspeed'),
            ElevatedButton(
              child: Text("normal"),
              onPressed: () {
                Timer.periodic(Duration(seconds: 1), (timer) {
                  setState(() {
                    counter++;
                  });
                });
              },
            ),
            Offstage(
              offstage: counter == 0,
              child: Text('$counter'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  Timer(Duration(seconds: 1), () {});
}
