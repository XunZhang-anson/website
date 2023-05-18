import 'package:flutter/material.dart';
import 'countcoin1.dart';
import 'pages/countcoin1.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {

  @override
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                                  OutlinedButton(
                                  child: Text('雙人遊戲',style: TextStyle(fontSize: 20.0)),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                              context, '/countcoin/1');
                                    }
                                    ),
                                    SizedBox(height: 16.0),
                                  OutlinedButton(
                                  child: Text('遊戲規則',style: TextStyle(fontSize: 20.0)),
                                    onPressed: () {

                                    }
                                  ),
                                  SizedBox(height: 32.0),
                        ]))));
  }
}
