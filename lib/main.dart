import 'package:flutter/material.dart';

import 'pages/bmi.dart';
import 'pages/speed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/bmi': (context) => const BMIPage(),
        '/speed': (context) => const SpeedPage(),
      },
      title: 'XunZhang\'s website',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'XunZhang\'s website'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/bmi');
              },
              icon: const Icon(Icons.calculate),
              label: const Text('BMI'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/speed');
              },
              icon: const Icon(Icons.calculate),
              label: const Text('Speed'),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
