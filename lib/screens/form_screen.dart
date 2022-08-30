import 'package:flutter/material.dart';
import 'package:flutter_application_o2/models/Informations.dart';
import 'package:flutter_application_o2/providers/information_provider.dart';
import 'package:flutter_application_o2/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const FormScreen());
}
class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _MyAppState();
}

class _MyAppState extends State<FormScreen> {

  String result = "0";
  String expression = "";

  buttonPressed(String value){

    setState(() {
      if( value == "CLEAR" ){
        result = "0";
      } else if ( value == "." ){

        if(result.contains(".")){
          return;
        } else {
          result = result + value;
        }

      } else if ( value == "=" ){

        expression = result.replaceAll("x", "*");

        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        dynamic calculate = exp.evaluate(EvaluationType.REAL, cm);
        
        result = "$calculate";

      } else {

        if( result == "0" ){
          result = value;
        } else {
          result = result + value;
        }
      }
    });
  }

  Widget myButton(String buttonLabel){
    return Expanded (
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonLabel),
        child: Text(buttonLabel,
          style: TextStyle(fontSize: 30,),),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),

        ),
        backgroundColor: Color.fromARGB(255, 178, 210, 236),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 24),
                alignment: Alignment.centerRight,
                child: Text(result,
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              ),
        
              Expanded(child: Divider()),
        
              Column(
                children: [
                  Row(
                children: [
                   myButton("7"),
                   myButton("8"),
                   myButton("9"),
                   myButton("/"),
                ],
              ),
        
              Row(
                children: [
                   myButton("4"),
                   myButton("5"),
                   myButton("6"),
                   myButton("x"),
                ],
              ),
        
              Row(
                children: [
                   myButton("1"),
                   myButton("2"),
                   myButton("3"),
                   myButton("-"),
                ],
              ),
        
              Row(
                children: [
                   myButton("."),
                   myButton("0"),
                   myButton("00"),
                   myButton("+"),
                ],
              ),
        
              Row(
                children: [
                   myButton("CLEAR"),
                   myButton("="),                
                ],
              ),
                ],
              )
            ],
          ),
        ),
      ),
       theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}