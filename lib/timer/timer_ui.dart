import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

void main() => runApp(SecondRoute(0));

class SecondRoute extends StatelessWidget {
  final int setTimer;
  SecondRoute(this.setTimer);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Simple Timer Widget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TimerController _timerController;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  final int setNumber = 10;

  @override
  void initState() {
    // initialize timercontroller
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: SimpleTimer(
              duration: Duration(minutes: setNumber),
              controller: _timerController,
              timerStyle: _timerStyle,
              onStart: handleTimerOnStart,
              onEnd: handleTimerOnEnd,
              valueListener: timerValueChangeListener,
              backgroundColor: Colors.grey,
              progressIndicatorColor: Colors.green,
              progressIndicatorDirection: _progressIndicatorDirection,
              progressTextCountDirection: _progressTextCountDirection,
              progressTextStyle: TextStyle(color: Colors.black),
              strokeWidth: 10,
            ),
          )),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      onPressed: _timerController.start,
                      child: const Text("Start",
                          style: TextStyle(color: Colors.white)),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green)),
                  TextButton(
                      onPressed: _timerController.pause,
                      child: const Text("Pause",
                          style: TextStyle(color: Colors.white)),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.blue)),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  void timerValueChangeListener(Duration timeElapsed) {}

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}
