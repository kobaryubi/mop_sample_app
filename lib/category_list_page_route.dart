import 'package:flutter/material.dart';
import './category_widget.dart';
import './unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryListPageRoute extends StatelessWidget{
  const CategoryListPageRoute();
  static const _categoryNames = <String>[
    "Length",
    "Area",
    "Volume",
    "Mass",
    "Time",
    "Digital Storage",
    "Energy",
    "Currency",
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final categoryWidgets = <CategoryWidget>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categoryWidgets.add(
        CategoryWidget(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: Icons.cake,
          units: _retrieveUnitList(_categoryNames[i]),
        )
      );
    }

    final categoryListView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categoryWidgets),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        "Category List Page",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: categoryListView,
    );
  }

  Widget _buildCategoryWidgets(List<Widget> categoryWidgets) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categoryWidgets[index],
      itemCount: categoryWidgets.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: "$categoryName Unit $i",
        conversion: i.toDouble(),
      );
    });
  }
}
