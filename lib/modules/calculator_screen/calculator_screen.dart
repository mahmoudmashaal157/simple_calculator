import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:simple_calculator/shared/components/compnents.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Color? greycolor = Colors.grey[800];   // this mark ? for NullSaftey thats mean the variable is nullable (it could be null)
  Color? whitecolor = Colors.white;
  Color? greencolor = Colors.lightGreen;
  Color? redcolor = Colors.red;

  String expression ="0";  //the expression value
  String Result= "0.0";   // the Result of the expression
  bool operationNotFirst = true; // this variable to avoid error expression like *31 or 31+* Look down for it's method
  bool DotNotFirstAndNotBehindOperator = true; //this variable to avoid this wrong +. 12..   Look down for it's method
  int _15digit = 0;  // counter to check the number is more than 15 digit or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("Calculator"),
       backgroundColor: greycolor,
      ),
      body: Container(
        color: Colors.black,
        width:double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right:  12.0),
                  child: Text(
                    expression,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                alignment: Alignment(1.0,1.0),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right:  12.0),
                child: Text(
                Result,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              alignment: Alignment(1.0,1.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 0.3,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: redcolor!,
                    onpresssed: (){
                  setState(() {
                    clear();
                    OperationResult();
                  });
                    },
                    text: "c",
                    fontsize: 50
                )
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: greencolor!,
                    onpresssed: (){
                     setState(() {
                       DeleteNumber();
                       OperationResult();
                  });
                    },
                    text: "⌫",
                    fontsize: 25
                )
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: greencolor!,
                    onpresssed: (){
                     setState(() {
                    OperationButtonPressed("%");

                  });
                    },
                    text: "%",
                    fontsize: 40)
                ),
                Expanded(child:
                 defaultButton(ButtonColor: greycolor!, textColor: greencolor!,
                    onpresssed: (){
                     setState(() {
                       OperationButtonPressed("/");

                  });
                    },
                    text: "÷  ",
                    fontsize: 50
                )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                    onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("7");
                        OperationResult();
                      });
                    },
                    text: "7"
                )
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                    onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("8");
                        OperationResult();
                      });
                    },
                    text: "8"
                )
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                    onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("9");
                        OperationResult();
                      });
                    },
                    text: "9"
                )
                ),
                Expanded(child:
                 defaultButton(ButtonColor: greycolor!, textColor: greencolor!,
                    onpresssed: (){
                      setState(() {
                        OperationButtonPressed("*");

                      });
                    },
                    text: "x",
                    fontsize: 50
                )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                    onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("4");
                        OperationResult();
                      });
                    },
                    text: "4"
                )
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                    onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("5");
                        OperationResult();
                      });
                    },
                    text: "5")
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                    onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("6");
                        OperationResult();
                      });
                    },
                    text: "6"
                )
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: greencolor!,
                    onpresssed: (){
                      setState(() {
                        OperationButtonPressed("-");

                      });
                    },
                    text: "-",
                    fontsize: 50
                )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(child:
                defaultButton(
                    ButtonColor: greycolor!,
                    textColor: whitecolor!,
                    onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("1");
                        OperationResult();
                      });
                    },
                     text: "1"
                )
                ),
                Expanded(child:
                defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                    onpresssed: (){
                        setState(() {
                          ButtonNumberPressed("2");
                          OperationResult();
                        });
                    },
                    text: "2"
                )
                ),
                Expanded(child:
                 defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                     onpresssed: (){
                      setState(() {
                        ButtonNumberPressed("3");
                        OperationResult();
                    });
                    }
                , text: "3")
                ),
                Expanded(child:
                 defaultButton(ButtonColor: greycolor!, textColor: greencolor!,
                     onpresssed: (){
                   setState(() {
                     OperationButtonPressed("+");

                   });
                     },
                     text: "+",
                     fontsize: 50
                 )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: zeroButton(
                      onpressed: (){
                        setState(() {
                          ButtonNumberPressed("0");
                          OperationResult();
                        });
                      }),
                ),
                Expanded(
                  child: defaultButton(ButtonColor: greycolor!, textColor: whitecolor!,
                      onpresssed: (){
                       setState(() {
                         DotButtonPressed();
                         OperationResult();
                       });
                      },
                      text: "."
                  ),
                ),
                Expanded(
                    child:
                    defaultButton(ButtonColor:Colors.green, textColor: whitecolor!,
                        onpresssed: (){
                        setState(() {
                        EqualButtonPressed();
                      });
                        },
                        text: "="
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void ButtonNumberPressed(String number){
    if(_15digit<15) {
      if (expression == "0") {
        expression = number;
      }
      else {
        expression = expression + number;
      }
      operationNotFirst = true;
      _15digit++;
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("number cannot be more than 15 digit"),
      ));
    }

  } // for number Buttons

  void OperationButtonPressed(String operation){

    if(operationNotFirst){
    expression = expression+operation;
    operationNotFirst = false;
    DotNotFirstAndNotBehindOperator=true;
    _15digit=0;
    }
  } // + * - / Buttons

  void DeleteNumber (){
    if(expression.isNotEmpty){

      if(expression[expression.length-1]!='+' && expression[expression.length-1]!='*'&&expression[expression.length-1]!='/'
      && expression[expression.length-1]!='-'){
        // this if we deleted a number from expression the counter of digits decrement and check that is not operator
       if(_15digit>0){
         _15digit--;
       }
      }
     expression= expression.substring(0,expression.length-1);
     if(expression.length==0){
       expression="0";
     }
    }

  }  //for delete button ⌫

  void clear (){
    expression="0";
    Result="0";
    _15digit=0;
  }  // for C button to clear the result and the expression

  void OperationResult(){
    // we will use a built in class  in dart that take the expression then it make the operations and give us the result
    // we added a (math_expressions)in pubspec.yaml
    Parser p = Parser();
    Expression operations = p.parse(expression);
    ContextModel cntxt = ContextModel() ;
    double TheResult = operations.evaluate(EvaluationType.REAL, cntxt);
    Result = TheResult.toStringAsPrecision(6); // if we have result of 1000000000 it show as 1.00000e+8
  } //for the Result

  void EqualButtonPressed(){
    if(Result=="0"){
      Result = expression;
    }
    else {
      expression = Result;

    }
  } // for = Button

  void DotButtonPressed(){
    // first check to sure that dot not after operator like this +. -.
    //second check to sure that Dot (.) after number
    // the rest of checks the same reason of first check
    //we cannot remove any check
    if(operationNotFirst==true && DotNotFirstAndNotBehindOperator==true &&expression.length-1!= '+'
        &&expression.length-1!= '*'&&expression.length-1!= '/'&&expression.length-1!= '-')
    {
      expression = expression + ".";
      DotNotFirstAndNotBehindOperator=false;
    }
  } //this for . Button

}
