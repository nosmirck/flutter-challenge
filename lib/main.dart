import 'package:flutter/material.dart';
import 'dart:math';

class Counter extends StatefulWidget {
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  bool good = false;
  bool fast = false;
  bool cheap = false;
  int counter = 0;

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Switch(
                        onChanged: (value) {
                          setState(() {
                            good = value;
                            value ? counter++ : counter--;
                            if (counter == 3) {
                              Random().nextBool()
                                  ? cheap = false
                                  : fast = false;
                              counter--;
                            }
                          });
                        },
                        value: good,
                        activeColor: Colors.greenAccent,
                      ),
                      Text('GOOD'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Switch(
                        onChanged: (value) {
                          setState(() {
                            cheap = value;
                            value ? counter++ : counter--;
                            if (counter == 3) {
                              Random().nextBool() ? good = false : fast = false;
                              counter--;
                            }
                          });
                        },
                        value: cheap,
                        activeColor: Colors.blueAccent,
                      ),
                      Text('CHEAP'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Switch(
                        onChanged: (value) {
                          setState(() {
                            fast = value;
                            value ? counter++ : counter--;
                            if (counter == 3) {
                              Random().nextBool()
                                  ? cheap = false
                                  : good = false;
                              counter--;
                            }
                          });
                        },
                        value: fast,
                        activeColor: Colors.redAccent,
                      ),
                      Text('FAST'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          child: Counter(),
        ),
      ),
    );
  }
}

main() {
  runApp(MyApp());
}
