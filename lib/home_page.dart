import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class HomePage extends StatefulWidget{ // creating a stateful widget
  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage>{ 
  @override
  var ansStr = "0";
  Widget build(BuildContext context) { // creating the widget
    return new Scaffold(
      backgroundColor: Color(0x192220),
      body: new Container( //defines the content of the body
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 300.0,
              ),
              alignment: Alignment.bottomRight,
              //color: Color(0x192220),
              child: Text(
                "$ansStr",
                style: TextStyle(
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.right,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 _buttonC("C", "", ""), 
                 _button("(", "", ""),
                 _button(")", "", ""),
                 _button("/", "c1", "")
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 _button("7", "", ""), 
                 _button("8", "", ""),
                 _button("9", "", ""),
                 _button("*", "c1", "")
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 _button("4", "", ""), 
                 _button("5", "", ""),
                 _button("6", "", ""),
                 _button("-", "c1", "")
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 _button("1", "", ""),
                 _button("2", "", ""),
                 _button("3", "", ""),
                 _button("+", "c1", "")
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 //_button("1", _clear),
                 _button("0", "", "big"),
                 _button(".", "", ""),
                 _buttonE("=","c2", "")
              ]
            )
          ]
        )
      )
    );
  }


  Widget _button (String number, String col, String big){
    var color;
    var width;
    void f()
    {
      setState((){
        if (ansStr == "0") {
          ansStr=number;
        } else {
          ansStr= ansStr+number;
        }
      });
    }

    if (big == "big") {
      width = 175.0;
    } else {
      width = 75.0;
    }
    if (col == "c1") {
      color = Colors.orange;
    } 
    else if (col == "c2"){
      color = Colors.green[400];
    }
    else {
      color = Colors.grey[850];
    }
    return MaterialButton(
      height: 75.0,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(22.0)
      ),
      child: Text(number,
      style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.white,
      color: color,
      onPressed: f,
    );
  }

  Widget _buttonC (String number, String col, String big){
    void f()
    {
      setState((){
        ansStr="0";
      });
    }

    return MaterialButton(
      height: 75.0,
      minWidth: 75.0,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(22.0)
      ),
      child: Text(number,
      style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.red[900],
      color: Colors.grey[850],
      onPressed: f,
    );
  }

  Widget _buttonE (String number, String col, String big){
    void f()
    {
      setState((){
        if (ansStr == "0") {
          ansStr="00";
        } else {
          try {
            Parser p = Parser();
            Expression exp = p.parse(ansStr);
            ContextModel cm = ContextModel();
            String eval = exp.evaluate(EvaluationType.REAL, cm).toString();
            ansStr = eval;
            
          } catch (e) {
            ansStr = "Bad Expression";
          }
          
        }
      });
    }

    return MaterialButton(
      height: 75.0,
      minWidth: 75.0,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(22.0)
      ),
      child: Text(number,
      style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.white,
      color: Colors.green[400],
      onPressed: f,
    );
  }



}