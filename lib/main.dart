import 'dart:async';
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFBB77)),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 5;
  Timer _timer;
  int colorVal = 0;

  void _startTimer() {
    _counter = 4;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 1) {
          _counter--;
        } else {
          colorVal++;
          colorVal = colorVal % 3;
          if (colorVal == 1)
            _counter = 3;
          else
            _counter = 5;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Светофор"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (colorVal == 0)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.red,
                      width: 70,
                      height: 70,
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.grey,
                      width: 70,
                      height: 70,
                    )),
            (colorVal == 1)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.yellow,
                      width: 70,
                      height: 70,
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.grey,
                      width: 70,
                      height: 70,
                    )),
            (colorVal == 2)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.green,
                      width: 70,
                      height: 70,
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.grey,
                      width: 70,
                      height: 70,
                    )),
            Text(
              '$_counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            RaisedButton(
              onPressed: () => _startTimer(),
              child: Text("Запустить"),
            ),
          ],
        ),
      ),
    );
  }
}
