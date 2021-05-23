import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovementConfigration_screen extends StatefulWidget {

  static final  routName = 'MovementConfigration_screen' ;
  @override
  _myhomeState createState() => _myhomeState();
}

class _myhomeState extends State<MovementConfigration_screen> {
  
  final movControll = TextEditingController();

  static List<TextEditingController> ValControll = List.generate(5, (i) => TextEditingController()) ;
   int index ;
   static List<double> val =List.filled(5, 0.0) ;
   bool putValue = false;

  void submitLimits(int index) {
    final valuuuu = double.parse(ValControll[index].text);

    if ( valuuuu < 0 ) {
      return;
    }
    setState(() {
      val[index]=double.parse(ValControll[index].text);
    });

  }

  value_movment()
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Movement"),
          ),
          Container(
            width: 150,
            child: TextField(
              controller: movControll,
              //onSubmitted: (_) => submitLimits(),
            ),),
        ],),);
  }

  Items(int index)
  {
    return Container(
        height: MediaQuery.of(context).size.height*0.15,
        width: MediaQuery.of(context).size.width,
      child: new Column(

          children:<Widget>[
          valueSeta(index),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("min" , style: TextStyle(fontSize: 18,),),
                   Text("max" , style: TextStyle(fontSize: 18,),),
                ],
              ),
            ),
            Container(
              child: Slider(
                max:100,
                min: 0,
                value: val[index],
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Colors.grey,
                label: '$val',
                onChanged: (double newval)
                {
                  setState(() {
                    val[index] = newval.roundToDouble()  ;
                    ValControll[index].text=newval.toString();
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
   valueSeta(int index)
  {
    return Container(
      padding: const EdgeInsets.all(2.0),
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width,
      child: new Row(
        children:<Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row (
              children: [
              Container(
              child:Image.asset('assets/images/theta.png')
              ),
              Text(" "+(index+1).toString()),
              ]
            ),
        ),
       Container(
         padding: EdgeInsets.all(4),
         decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0)),
              color: Colors.grey[200]),
         width:100,
         child: TextField(
          //decoration: InputDecoration(labelText: 'value'),
          controller: ValControll[index] ,
          onSubmitted: (_) => submitLimits(index),
  ),),
  ],),);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:Text("Monvment configuration")),
      body: SingleChildScrollView (
      child:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
          Container(
            //height: MediaQuery.of(context).size.height,
            //width: MediaQuery.of(context).size.width,
            child: new Column(
              //mainAxisAlignment: MainAxisAlignment.,
                children: <Widget>[
                  value_movment(),
                  ListView .builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx,index){return Items(index);},
                    itemCount: 5,
                  )
                ]
            ),
          )
      ),
    )
    );
  }
}