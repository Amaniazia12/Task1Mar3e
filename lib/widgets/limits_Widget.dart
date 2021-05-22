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
    return Container(
      height: MediaQuery.of(context).size.height/6,
      width: MediaQuery.of(context).size.width/6,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("sita"+index),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Min'),
                    controller: minValControl,
                    onSubmitted: (_) => submitLimits(),
                    ),
                ),
                Container(
                  width:100,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Max'),
                    controller: maxValControl,
                    onSubmitted: (_) => submitLimits(),
                        ),
                     ),
                    ],
          )
    );
  }
}