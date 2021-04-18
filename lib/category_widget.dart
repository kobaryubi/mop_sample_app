import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import './converter_page_route.dart';
import './unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryWidget extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const CategoryWidget({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverterPageRoute(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return ConverterPageRoute(
              name: name,
              color: color,
              units: units,
          );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color["highlight"],
          splashColor: color["splash"],
          onTap: () => _navigateToConverterPageRoute(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
