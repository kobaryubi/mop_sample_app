import 'package:flutter/material.dart';

class LoggerRoute extends StatefulWidget {
  const LoggerRoute();

  @override
  _LoggerRouteState createState() => _LoggerRouteState();
}

class _LoggerRouteState extends State<LoggerRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logger Route'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text('TEST'),
            ],
          ),
        ),
      ),
    );
  }
}
