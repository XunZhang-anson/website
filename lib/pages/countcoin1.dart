import 'dart:math';

import 'package:flutter/material.dart';

class Coin1Page extends StatefulWidget {
  const Coin1Page({super.key});

  @override
  State<Coin1Page> createState() => _Coin1PageState();
}

class _Coin1PageState extends State<Coin1Page> {
  int _count = 0, _number = 0;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _count = Random().nextInt(16) + 15;
      /*_guessNumber = null;
      _guessesLeft = 5;
      _hintText = '從一個1~100猜一個數字(有5次機會)';
      _textEditingController.clear();*/
    });
  }

  double mathIconWidth() {
    var width = MediaQuery.of(context).size.width;
    return (width - 16) / 4;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('countcoin'),
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
                      // Expanded(flex: 1, child: Container(color: Colors.red)),
                      Expanded(
                          flex: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () {
                                    setState(() {
                                      _count -= 1;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('1'),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number < 2
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 2;
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('2'),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number < 3
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 3;
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('3'),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number < 4
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 4;
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('4'),
                                  )),
                            ],
                          )),
                      Expanded(flex: 5, child: Container(child: Image.asset('assets/images/coin/coin30.png'))),
                      Expanded(
                          flex: 0,
                          child: Row(children: [
                            IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: null),
                          ])),
                      // Expanded(flex: 1, child: Container(color: Colors.red)),
                    ]))));
  }
}
