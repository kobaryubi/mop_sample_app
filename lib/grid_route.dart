import 'package:flutter/material.dart';

class GridRoute extends StatefulWidget {
  const GridRoute();

  @override
  _GridRouteState createState() => _GridRouteState();
}

class _GridRouteState extends State<GridRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Route'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            childAspectRatio: 3.0,
            children: <Widget>[
              Container(child: Text('100'), color: Colors.teal[100],),
              Container(child: Text('200'), color: Colors.teal[200],),
              Container(child: Text('300'), color: Colors.teal[300],),
              Container(child: Text('400'), color: Colors.teal[400],),
              Container(child: Text('500'), color: Colors.teal[500],),
              Container(child: Text('600'), color: Colors.teal[600],),
            ],
          ),
        ),
      ),
    );
  }
}
