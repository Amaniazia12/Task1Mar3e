import 'package:flutter/material.dart';
import 'package:task1/screens/setting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Setting_Screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting limits"),
      ),
      body: GridView(
       gridDelegate: 
        SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2.5,
          ),
       //children: ,
        //DUMMY_CATEGORIES.map((cItem) => CategoryIteam(cItem.id, cItem.title, cItem.color) 
         // ).toList(),
       ),
    );
  }
}
