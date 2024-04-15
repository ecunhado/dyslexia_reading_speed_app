import 'package:flutter/material.dart';

class ValueDisplay extends StatelessWidget {
  final Text _label;
  final Text _value;

  ValueDisplay(this._label, this._value);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 70,
          width: 150,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 2, color: Colors.black)),
          ),
          child: Center(child: _value),
        ),
        _label,
      ],
    );
  }
}

