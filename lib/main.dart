import 'package:flutter/material.dart';
import 'package:prj_study_timer_flutter/timer/timer_ui.dart';

void main() => runApp(TimerApp());

class TimerApp extends StatelessWidget {
  final titleText = 'timerapp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(titleText: titleText),
    );
  }
}

class Home extends StatelessWidget {
  final String? titleText;
  const Home({this.titleText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('資格アプリ'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            // 10, 25, 60, 120, 240分の5つをセットする
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute(10)),
                );
              },
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                title: Text(
                  '10分タイマー',
                  style: TextStyle(fontSize: 30),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
