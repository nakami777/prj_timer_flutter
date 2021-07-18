import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: TimerSamplePage())); // ここが Widget ツリーの起点
}

class TimerSamplePage extends StatefulWidget {
  // 状態を持ちたいので StatefulWidget を継承
  @override
  _TimerSamplePageState createState() => _TimerSamplePageState();
}

class _TimerSamplePageState extends State<TimerSamplePage> {
  late Timer _timer; // この辺が状態
  late DateTime _time;

  @override
  void initState() {
    // 初期化処理
    _time = DateTime.utc(0, 0, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // setState() の度に実行される
    return Scaffold(
        appBar: AppBar(title: const Text('資格勉強アプリ')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SecondPage();
                  }),
                );
              },
              child: Text('次のページへ'),
            ),
          ),
          Text(
            DateFormat.Hms().format(_time),
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // Stopボタンタップ時の処理
                  if (_timer != null && _timer.isActive) _timer.cancel();
                },
                child: Text("Stop"),
              ),
              FloatingActionButton(
                onPressed: () {
                  // Startボタンタップ時の処理
                  _timer = Timer.periodic(
                    Duration(seconds: 1), // 1秒毎に定期実行
                    (Timer timer) {
                      setState(() {
                        // 変更を画面に反映するため、setState()している
                        _time = _time.add(Duration(seconds: 1));
                      });
                    },
                  );
                },
                child: Text("Start"),
              ),
            ],
          )
        ]));
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('次のページ')),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('戻る')),
        ));
  }
}
