import 'dart:math';
import 'package:flutter/material.dart';

class GuessNumberPage extends StatefulWidget {
  const GuessNumberPage({super.key});

  @override
  _GuessNumberPageState createState() => _GuessNumberPageState();
}

class _GuessNumberPageState extends State<GuessNumberPage> {
  int? _targetNumber;
  int? _guessNumber;
  int _guessesLeft = 5;
  String? _hintText;
  bool isstop = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _targetNumber = Random().nextInt(100) + 1;
      _guessNumber = null;
      _guessesLeft = 5;
      _hintText = '從一個1~100猜一個數字(有5次機會)';
      _textEditingController.clear();
    });
  }

  void _checkGuess() {
    int? guess = int.tryParse(_textEditingController.text);
    if (guess != null) {
      setState(() {
        _guessNumber = guess;
        _guessesLeft--;
        if (_guessNumber == _targetNumber) {
          isstop = true;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('成功'),
                content:
                    Text('恭喜! 你在第${5 - _guessesLeft}次 猜中了答案$_targetNumber'),
                actions: [
                  TextButton(
                    onPressed: () {
                      _startNewGame();
                      Navigator.of(context).pop();
                      isstop = false;
                    },
                    child: Text('重新開始'),
                  ),
                ],
              );
            },
          );
        } else if (_guessNumber! < _targetNumber!) {
          _hintText = '猜得太低 再試試看吧 還剩${_guessesLeft}次機會';
        } else {
          _hintText = '猜得太高 再試試看吧 還剩${_guessesLeft}次機會';
        }
        if (_guessesLeft == 0 && isstop == false) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('失敗'),
                content: Text('你用完了所有次數 該數字為 $_targetNumber.'),
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
        }
        _textEditingController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('猜一個數字'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _hintText!,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '請輸入數字',
                ),
                onSubmitted: (_) => _checkGuess(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkGuess,
              child: Text('確認'),
            ),
          ],
        ),
      ),
    );
  }
}
