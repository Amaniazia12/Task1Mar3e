import 'package:flutter/material.dart';
import '../widgets/limits_Widget.dart';
class Setting_Screen extends StatefulWidget {
  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  @override
  int index=0;
  Widget build(BuildContext context) {
    return Scaffold(
     body: 
     ListView .builder(
        itemBuilder: (ctx,index){
         return LimitsWidget(index.toString());
        },
        itemCount: 5,
        ), 
      
     );
  }
}