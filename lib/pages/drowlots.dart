import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class drowlotsPage extends StatefulWidget {
  const drowlotsPage({super.key});

  @override
  State<drowlotsPage> createState() => _drowlotsPageState();
}

class _drowlotsPageState extends State<drowlotsPage> {
  final TextEditingController _Controller1 = TextEditingController();
  String? _result;
  bool _haveResult = false;
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
                /*Image.asset(' '),*/
                Card(
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          TextFormField(
                            controller: _Controller1,
                            keyboardType: TextInputType.multiline,
                            onChanged: (value) {},
                            minLines: 10,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              hintText: '請輸入',
                            ),
                          ),
                        ]))),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: Text("點擊執行抽籤", style: TextStyle(fontSize: 30.0)),
                    onPressed: () {
                      var input = _Controller1.text;
                      var inputList = input.split('\n');
                      var random = new Random();
                      var index = random.nextInt(inputList.length); 
                      setState(() {
                        _result = inputList[index];
                        _haveResult = true;
                      });
                    },
                  ),
                ),
                Offstage(
                offstage: !_haveResult,
                child: Wrap(
                  children: [
                    Text('抽中的是：$_result', style: TextStyle(fontSize: 30.0)),
                  ],
                ),)
              ],
            ),
          )),
        ));
  }
}
