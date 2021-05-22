import 'dart:math';

import 'package:flutter/material.dart';
class LimitsWidget extends StatelessWidget {
 
  final String index ;
  final minList=[];
  final maxList=[];
  final minValControl = TextEditingController();
  final maxValControl = TextEditingController();
  LimitsWidget(
    @required this.index
    );
  void submitLimits() {
    final minval = double.parse(minValControl.text);
    final maxval = double.parse(maxValControl.text);
    if ( minval < 0 || maxval <0 ) {
      return;
    }
    minList.add(minval);
    maxList.add(maxval);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("sita"+index),
        TextField(
          decoration: InputDecoration(labelText: 'Min'),
          controller: minValControl,
          onSubmitted: (_) => submitLimits(),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Max'),
          controller: maxValControl,
          onSubmitted: (_) => submitLimits(),
        ),
      ],
    );
  }
}