import 'package:flutter/material.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryPage extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  const CategoryPage({
    Key key,
    this.name,
    this.color,
    this.iconLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: _rowHeight,
            child: InkWell(
              borderRadius: _borderRadius,
              highlightColor: color,
              splashColor: color,
              onTap: () {
                print("I was tapped!");
              },
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
        ),
      ),
    );
  }
}
