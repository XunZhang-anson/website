import 'dart:math';

import 'package:flutter/material.dart';

class Coin2Page extends StatefulWidget {
  const Coin2Page({super.key});

  @override
  State<Coin2Page> createState() => _Coin2PageState();
}

class _Coin2PageState extends State<Coin2Page> {
  int _count = 0, _number = 0;
  bool _player=true,_player11 = true, _player12 = true, _player13 = true, _player14 = true , _player21 = true, _player22 = true, _player23 = true, _player24 = true;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _count = Random().nextInt(16) + 15;
      _switch();
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
                                  onTap: !_player11 || _count < 1 || _player
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 1;
                                            _player11 = false;
                                            _switch();                                            
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: _player || _count < 1 || !_player11
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: !_player12 || _player || _count < 2
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 2;
                                            _player12 = false;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        color: !_player12 || _player || _count < 2
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: !_player13 || _player || _count < 3
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 3;
                                            _player13 = false;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: !_player13 || _player || _count < 3
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: !_player14 || _player || _count < 4
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 4;
                                            _player14 = false;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                        color: !_player14 || _player || _count < 4
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                              child: Image.asset(
                                  'assets/images/coin/coin$_count.png'))),
                      Expanded(
                          flex: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: !_player || _count < 1 || !_player21
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 1;
                                            _player21 = false;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: !_player || _count < 1 || !_player21
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: !_player22 || !_player || _count < 2
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 2;
                                            _player22 = false;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        color: !_player22 || !_player || _count < 2
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: !_player23 || !_player || _count < 3
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 3;
                                            _player23 = false;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: !_player23 ||
                                                !_player ||
                                                _count < 3
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: !_player24 || !_player || _count < 4
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 4;
                                            _player24 = false;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                        color: !_player24 ||
                                                !_player ||
                                                _count < 4
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                      // Expanded(flex: 1, child: Container(color: Colors.red)),
                    ]))));
  }

  /*void _dice() {
    setState(() {
      _number = Random().nextInt(4) + 1;
    });
  }*/

  void _switch() {
    if (_count > 0 && _number < 8) {
      setState(() {
        _player = !_player;
        _number++; 
      });
    } else if (_count > 0 && _number > 7) {
      setState(() {
        _player = !_player;
        _number = 0;
        _player11 = true; _player12 = true; _player13 = true; _player14 = true ; _player21 = true; _player22 = true; _player23 = true; _player24 = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('player${!_player ? 1 : 2} win'),
            content: Text('恭喜! 你贏了'),
            actions: [
              TextButton(
                onPressed: () {
                  _number = 0;_player11 = true; _player12 = true; _player13 = true; _player14 = true ; _player21 = true; _player22 = true; _player23 = true; _player24 = true;
                  _startNewGame();
                  Navigator.of(context).pop();
                },
                child: Text('重新開始'),
              ),
            ],
          );
        },
      );
    }
  }
}
