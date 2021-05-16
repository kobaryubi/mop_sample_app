import 'package:flutter/material.dart';

class GestureRoute extends StatefulWidget {
  const GestureRoute();

  @override
  _GestureRouteState createState() => _GestureRouteState();
}

class _GestureRouteState extends State<GestureRoute> {
  bool _lights = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Route'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.lightbulb_outline,
                      color: _lights ? Colors.yellow.shade600 : Colors.black,
                      size: 60,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _lights = !_lights;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(_lights ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
                    ),
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
