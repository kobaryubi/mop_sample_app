import 'package:flutter/material.dart';

import './category_route.dart';
import './animation_route.dart';
import './gesture_route.dart';
import './logger_route.dart';
import './grid_route.dart';

void main() {
  runApp(MopSampleApp());
}

class MopSampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Page',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.grey[600],
              ),
          primaryColor: Colors.grey[500],
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: Colors.green[500],
          )),
      home: HelloPageRoute(),
    );
  }
}

class HelloPageRoute extends StatefulWidget {
  const HelloPageRoute();

  @override
  _HelloPageRouteState createState() => _HelloPageRouteState();
}

class _HelloPageRouteState extends State<HelloPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Hello!",
                      style: TextStyle(fontSize: 40.0),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    // TODO: Add Menu Buttons
                    child: ElevatedButton(
                      onPressed: onCategoryRoutePressed,
                      child: Text("Category Route"),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onAnimationRoutePressed,
                      child: Text('Animation Route'),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onGestureRoutePressed,
                      child: Text('Gesture Route'),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onLoggerRoutePressed,
                      child: Text('Logger Route'),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onGridRoutePressed,
                      child: Text('Grid Route'),
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

  Future<void> onCategoryRoutePressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryRoute(),
      ),
    );
  }

  Future<void> onAnimationRoutePressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimationRoute(),
      ),
    );
  }

  Future<void> onGestureRoutePressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GestureRoute(),
      ),
    );
  }

  Future<void> onLoggerRoutePressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoggerRoute(),
      ),
    );
  }

  Future<void> onGridRoutePressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GridRoute(),
      ),
    );
  }
}
