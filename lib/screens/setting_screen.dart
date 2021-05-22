import 'package:flutter/material.dart';
import '../widgets/limits_Widget.dart';
import 'package:flutter/src/rendering/box.dart';

class Setting_Screen extends StatefulWidget {
  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title:Text("Setting Limits")
     ),
     body:Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: new Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           ListView .builder(
               shrinkWrap: true,
               itemBuilder: (ctx,index){return LimitsWidget(index.toString());},
               itemCount: 5,
              )
          ]
         ),
     )
     );
  }
}