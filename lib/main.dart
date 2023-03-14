import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'pages/bmi.dart';
import 'pages/speed.dart';
import 'pages/handspeed.dart';
import 'pages/drowlots.dart';
import 'pages/clickcolor.dart';
import 'pages/guessnumber.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
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
        '/handspeed': (context) => const HandspeedPage(),
        '/drowlots': (context) => const drowlotsPage(),
        '/clickcolor': (context) => const ClickcolorPage(),
        '/guessnumber': (context) => const GuessNumberPage(),
      },
      title: 'Website of XunZhang',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'ShantellSans',
        fontFamilyFallback: const ['KleeOne'],
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Website of XunZhang'),
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
      body: Container(
        height:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 640,
                ),
                
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: [
                        Card(
                            child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 120.0,
                          ),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                Text('我是',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    textAlign: TextAlign.center),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  constraints: const BoxConstraints(
                                    minWidth: 160.0,
                                    minHeight: 120.0,
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    isRepeatingAnimation: true,
                                    animatedTexts: [
                                      RotateAnimatedText(
                                        'XunZhang',
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                      RotateAnimatedText(
                                        '勳章',
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text('這是一個包含各式各樣的工具與小遊戲的網頁\n祝你用得愉快',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.center),
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.center,
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
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/handspeed');
                                  },
                                  icon: const Icon(Icons.sports_esports),
                                  label: const Text('Handspeed'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/drowlots');
                                  },
                                  icon: const Icon(Icons.sports_esports),
                                  label: const Text('Drowlots'),
                                ),
                              ],
                            ),
                          ]),
                        )),
                        const SizedBox(height: 64),
                        Card(
                          child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 120.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('By ChatGPT',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                  Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    alignment: WrapAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/clickcolor');
                                        },
                                        icon: const Icon(Icons.sports_esports),
                                        label: const Text('Clickcolor'),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/guessnumber');
                                        },
                                        icon: const Icon(Icons.sports_esports),
                                        label: const Text('Guessnumber'),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        )
                      ]),
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
