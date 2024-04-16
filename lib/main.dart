import 'package:flutter/material.dart';
import 'package:dyslexia_reading_speed_app/num_pad.dart';
import 'value_display.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Words/min. Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // stopwatch
  late Stopwatch _stopwatch;
  late Timer _t;
  int _secs = 0;
  Color _startStopColor = Colors.green;
  Text _startStopText = const Text('Start');

  // number of words
  int _words = 0;

  // score
  double _score = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  // handles stop and start of the stopwatch
  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _startStopColor = Colors.green;
      _startStopText = const Text('Continue');
    } else {
      _stopwatch.start();
      _startStopColor = Colors.red;
      _startStopText = const Text('Stop');
    }
  }

  String returnFormattedText() {
    _secs = _stopwatch.elapsed.inSeconds;

    String seconds =
        (_secs % 60).toString().padLeft(2, "0"); // seconds in string
    String minutes =
        (_secs ~/ 60).toString().padLeft(2, "0"); // minutes in string

    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();

    _t = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView.count(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          padding: const EdgeInsets.only(left: 80, right: 80),
          crossAxisSpacing: 50,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio: (1 / .8),
          children: <Widget>[
            ValueDisplay(
                const Text(
                  'Time',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  returnFormattedText(),
                  style: const TextStyle(fontSize: 25),
                )),
            ValueDisplay(
                const Text(
                  'Words',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '$_words',
                  style: const TextStyle(fontSize: 25),
                )),
            ValueDisplay(
                const Text(
                  'Score',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  _score.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 25),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 160,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      handleStartStop();
                    },
                    color: _startStopColor,
                    child: Container(
                      // padding: const EdgeInsets.all(2.0),
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: _startStopText),
                    ),
                  ),
                ),
              ],
            ),
            NumPad(
              words: _words,
              callback: (val) => setState(() => _words = val),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                  width: 160,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    // this the cupertino button and here we calculate the words per minute
                    onPressed: () {
                      _score = _words / _secs * 60;
                    },
                    color: Colors.yellow,
                    child: Container(
                      // padding: const EdgeInsets.all(8.0),
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text("Calculate"),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 15,
                ),
                SizedBox(
                  height: 60,
                  width: 160,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    // this the cupertino button and here we perform all the reset button function
                    onPressed: () {
                      _stopwatch.stop();
                      _stopwatch.reset();
                      _startStopColor = Colors.green;
                      _startStopText = const Text('Start');
                      _score = 0.0;
                      _words = 0;
                    },
                    color: Colors.red,
                    child: Container(
                      // padding: const EdgeInsets.all(8.0),
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text("Reset"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
