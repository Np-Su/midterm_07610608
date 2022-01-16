import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        disabledColor:Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Column(
                  //mainAxisSize: MainAxisSize.min
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('PIG WEIGHT',
                      style:TextStyle(fontSize: 36.0, color: Colors.pinkAccent),
                    ),
                    Text('CALCULATOR',
                      style:TextStyle(fontSize: 36.0, color: Colors.pinkAccent),
                    ),
                    Image.asset('assets/images/pig.png', height: 285, width: 260,),

                /*    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(1.0),
                        labelText: 'Enter Length',
                      ),
                    ),
                    TextField(
                      controller: _controller2,
                      decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(1.0),
                        filled: true,
                        labelText: 'Enter girth',
                      ),
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          width: 200.0,
                          height: 150.0,
                          //color: Colors.deepPurple,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              fillColor: Colors.white.withOpacity(1.0),
                              filled: true,
                              labelText: 'Length \n(cm)',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          width: 200.0,
                          height: 150.0,
                          //color: Colors.deepPurple,
                          child: TextField(
                            controller: _controller2,
                            decoration: InputDecoration(
                              fillColor: Colors.white.withOpacity(1.0),
                              filled: true,
                              labelText: 'Enter girth \n(cm)',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:16.0 ,),

                    ElevatedButton(onPressed: (){
                      var calcualte = cal();
                      var input = _controller.text; var input2 = _controller2.text;
                      var inputChangType = double.tryParse(input!);
                      var inputChangType2 = double.tryParse(input2!);
                      if (inputChangType is double != true || inputChangType2 is double != true) {
                        showDialog(
                            context: context,
                            barrierDismissible: false, //กดพื้นที่รอบๆ จะไม่ติด
                            builder:(BuildContext context) {
                              return AlertDialog(
                                  title: Text('ERROR'),
                                  content: Text('invalid input'),
                                  actions:[
                                    ElevatedButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                        child: Text('OK'))
                                  ]
                              );
                            });
                      }else{
                        var weight =   calcualte.calulateWeight(inputChangType!, inputChangType2!);
                        var price  = calcualte.calulatePrice();
                        var minWeight   = calcualte.calulateMin(weight);
                        var hightWeight = calcualte.calulateHight(weight);
                        var minPrice    = calcualte.calulateMin(price);
                        var hightPrice  = calcualte.calulateHight(price);
                        showDialog(
                            context: context,
                            barrierDismissible: false, //กดพื้นที่รอบๆ จะไม่ติด
                            builder:(BuildContext context) {
                              return AlertDialog(
                                 // Image:('assets/images/ic_pig', width: 50, height: 50, fit: BoxFit.contain,),
                                  title: Text('RESULT'),
                                  content: Text('Weight : $minWeight - $hightWeight kg\n Price : $minPrice - $hightPrice Bath'),
                                  actions:[
                                    ElevatedButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                        child: Text('OK'))
                                  ]
                              );
                            });
                      }
                    }, child: Text('CALCULATE'))
                  ],
                ),

              ),

            ],

          ),

      ),
      /*appBar: AppBar(
        //title: Text('GUESS THE NUMBER'),
      ),*/

    );
  }
}
