import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import './unit.dart';

const _padding = EdgeInsets.all(16.0);

class ConverterPageRoute extends StatefulWidget {
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
  _ConverterPageRouteState createState() => _ConverterPageRouteState();
}

class _ConverterPageRouteState extends State<ConverterPageRoute> {
  Unit _fromValue;
  Unit _toValue;
  List<DropdownMenuItem> _unitMenuItems;
  double _inputValue;
  String _convertedValue = "";
  bool _showValidationError = false;

  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.units) {
      newItems.add(DropdownMenuItem(
        value: unit.name,
        child: Container(
          child: Text(
            unit.name,
            softWrap: true,
          ),
        ),
      ));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  void _setDefaults() {
    setState(() {
      _fromValue = widget.units[0];
      _toValue = widget.units[1];
    });
  }

  void _updateConversion() {
    setState(() {
      _convertedValue =
          _format(_inputValue * (_toValue.conversion / _fromValue.conversion));
    });
  }

  void _updateInputValue(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        _convertedValue = "";
      } else {
        try {
          final inputDouble = double.parse(input);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch (e) {
          print("Error: $e");
          _showValidationError = true;
        }
      }
    });
  }

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains(".") && outputNum.endsWith("0")) {
      var i = outputNum.length - 1;
      while (outputNum[i] == "0") {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith(".")) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  Widget _createDropdown(String currentValue, ValueChanged<dynamic> onChanged) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[50],
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: currentValue,
              items: _unitMenuItems,
              onChanged: onChanged,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }

  Unit _getUnit(String unitName) {
    return widget.units.firstWhere(
        (Unit unit) {
          return unit.name == unitName;
        },
      orElse: null,
    );
  }

  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _fromValue = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  void _updateToConversion(dynamic unitName) {
    setState(() {
      _toValue = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  @override
  Widget build(BuildContext context) {
    final input = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.headline4,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.headline4,
              errorText: _showValidationError ? "Invalid number entered" : null,
              labelText: "Input",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: _updateInputValue,
          ),
          _createDropdown(_fromValue.name, _updateFromConversion),
        ],
      ),
    );

    final arrows = RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.compare_arrows,
        size: 40.0,
      ),
    );

    final output = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputDecorator(
            child: Text(
              _convertedValue,
              style: Theme.of(context).textTheme.headline4,
            ),
            decoration: InputDecoration(
              labelText: "Output",
              labelStyle: Theme.of(context).textTheme.headline4,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          _createDropdown(_toValue.name, _updateToConversion),
        ],
      ),
    );

    final converter = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        input,
        arrows,
        output,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          widget.name,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        backgroundColor: widget.color,
      ),
      body: Padding(
        padding: _padding,
        child: converter,
      ),
      // This prevents the attempt to resize the screen when the keyboard is opened
      resizeToAvoidBottomInset: false,
    );
  }
}
