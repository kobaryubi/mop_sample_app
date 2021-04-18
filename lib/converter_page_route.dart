import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import './unit.dart';

class ConverterPageRoute extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final List<Unit> units;

  const ConverterPageRoute({
    Key key,
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final unitWidgets = units.map((Unit unit) {
      return Container(
        color: color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Conversion: ${unit.conversion}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        backgroundColor: color,
      ),
      body: ListView(
        children: unitWidgets,
      ),
    );
  }
}
