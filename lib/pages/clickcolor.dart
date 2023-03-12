import 'dart:math';
import 'package:flutter/material.dart';


class ClickcolorPage extends StatefulWidget {
   const ClickcolorPage({super.key});

  @override
  _ClickcolorPageState createState() => _ClickcolorPageState();
}

class _ClickcolorPageState extends State<ClickcolorPage> {
  int _score = 0;
  double _boxSize = 200.0;
  Color _boxColor = Colors.blue;
  final Random _random = Random();

  void _increaseScore() {
    setState(() {
      _score++;
      _boxSize -= 2;
      if (_boxSize < 20) {
        _boxSize = 20;
      }
      _boxColor = Color.fromRGBO(
          _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Click the Box'),
      ),
      body: GestureDetector(
        onTap: _increaseScore,
        child: Container(
          color: Colors.white,
          child: Center(
            child: AnimatedContainer(
              width: _boxSize,
              height: _boxSize,
              decoration: BoxDecoration(
                color: _boxColor,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _score = 0;
            _boxSize = 200.0;
            _boxColor = Colors.blue;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
