import 'dart:math';

import 'package:flutter/material.dart';

class Coin3Page extends StatefulWidget {
  const Coin3Page({super.key});

  @override
  State<Coin3Page> createState() => _Coin3PageState();
}

class _Coin3PageState extends State<Coin3Page> {
  int _count = 0, _number = 0;
  bool _player = true;

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
                                  onTap: _player || _count < 1 || _number == 1
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 1;
                                            _number = 1;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: _player ||
                                                _count < 1 ||
                                                _number == 1
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number == 2 || _player || _count < 2
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 2;
                                            _number = 2;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        color: _number == 2 ||
                                                _player ||
                                                _count < 2
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number == 3 || _player || _count < 3
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 3;
                                            _number = 3;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: _number == 3 ||
                                                _player ||
                                                _count < 3
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number == 4 || _player || _count < 4
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 4;
                                            _number = 4;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                        color: _number == 4 ||
                                                _player ||
                                                _count < 4
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number == 5 || _player || _count < 5
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 5;
                                            _number = 5;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                        color: _number == 5 ||
                                                _player ||
                                                _count < 5
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
                                  onTap: !_player || _count < 1 || _number == 1
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 1;
                                            _number = 1;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: !_player ||
                                                _count < 1 ||
                                                _number == 1
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number == 2 || !_player || _count < 2
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 2;
                                            _number = 2;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        color: _number == 2 ||
                                                !_player ||
                                                _count < 2
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number == 3 || !_player || _count < 3
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 3;
                                            _number = 3;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: _number == 3 ||
                                                !_player ||
                                                _count < 3
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: _number == 4 || !_player || _count < 4
                                      ? null
                                      : () {
                                          setState(() {
                                            _count -= 4;
                                            _number = 4;
                                            _switch();
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                        color: _number == 4 ||
                                                !_player ||
                                                _count < 4
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )),
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: _number == 5 || !_player || _count < 5
                                    ? null
                                    : () {
                                        setState(() {
                                          _count -= 5;
                                          _number = 5;
                                          _switch();
                                        });
                                      },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      color:
                                          _number == 5 || !_player || _count < 5
                                              ? Colors.black
                                              : Colors.white,
                                    ),
                                  ),
                                ),
                              )
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
    if (_count > 0 && (_number != _count || _count != 1)) {
      setState(() {
        _player = !_player;
      });
    } else if (_count == 1 && _number == _count) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('player${!_player ? 2 : 1} win'),
            content: Text('恭喜! 你贏了'),
            actions: [
              TextButton(
                onPressed: () {
                  _startNewGame();
                  Navigator.of(context).pop();
                },
                child: Text('重新開始'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('player${!_player ? 1 : 2} win'),
            content: Text('恭喜! 你贏了'),
            actions: [
              TextButton(
                onPressed: () {
                  _number = 0;
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
