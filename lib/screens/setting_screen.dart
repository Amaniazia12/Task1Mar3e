import 'package:flutter/material.dart';
import 'package:task1/screens/movementConfiguration_screen.dart';
import '../widgets/limits_Widget.dart';
import 'package:flutter/src/rendering/box.dart';

class Setting_Screen extends StatefulWidget {
  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  static final minList=[];

  static final maxList=[];

  //final minValControl = TextEditingController();
  static List<TextEditingController> minValControl = List.generate(10, (i) => TextEditingController()) ;
  //final maxValControl = TextEditingController();
  static List<TextEditingController> maxValControl = List.generate(10, (i) => TextEditingController()) ;

  void submitLimits(BuildContext context,int index) {
    //final minval = double.parse(minValControl[index].text);
    //final maxval = double.parse(maxValControl[index].text);
   // if ( minval < 0 || maxval <0 ) {
    //  return;
   // }
    minList.add(double.parse(minValControl[index].text));
    maxList.add(double.parse(maxValControl[index].text));
   
   //Navigator.of(context).pop();
  }

  void _nextScreen (BuildContext cont ){
    Navigator.of(cont).pushNamed(
       MovementConfigration_screen.routName,
       arguments: {
       'minList': minList,
       'maxList': maxList,
        }
      );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title:Text("Setting Limits" , style: 
       TextStyle(color: Colors.white),)
     ),
     body:SingleChildScrollView(
       child:Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: new Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            ListView .builder(
               shrinkWrap: true,
               itemBuilder: (ctx,index){ 
                 return _LimitsWidget(context , index);
                 },
               itemCount: 5,),
           SizedBox(
              height:50
            ),    
           GestureDetector(  
                onTap:(){  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MovementConfigration_screen(maxList:maxList  , minList:minList);
                }));},
                child: Container(
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)),
                          color: Theme.of(context).primaryColor),
                    child: Text('Movement Configration', style:TextStyle(
                          fontWeight: FontWeight.bold ,
                          color: Colors.white
                          )
                          ),
                  )
            ),
            
          ]
         ),
       )
       )
     );
   }
   Widget _LimitsWidget(BuildContext context ,int index) {
    return SingleChildScrollView(
      child: Container (
      padding: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height*0.13,
      width: MediaQuery.of(context).size.width,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
           Padding(
                  padding: const EdgeInsets.all(25.0),
                  child : Row (
                    children: [
                      Container(
                        child:Image.asset('assets/images/theta.png')),
                      Text(" "+(index+1).toString()),]
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                        color: Colors.grey[200]),
                  width: 100,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(labelText: ' min'),
                    keyboardType: TextInputType.number,
                    controller: minValControl[index],
                    //onSubmitted: (_) => submitLimits(context,index),
                    ),
                ),
                Container(
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                        color: Colors.grey[200]),
                  height: 50,
                  width:100,
                  child: TextField(
                    decoration: InputDecoration(labelText: '  max'),
                    keyboardType: TextInputType.number,
                    controller: maxValControl[index],
                    onSubmitted: (_) => submitLimits(context,index),
                        ),
                     ),
                    ],
          )
    )
    ) ;
  }
}