import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Here we using Reusable Components because we have the same design for all buttons except 0 button

//Here we go :

Widget defaultButton({
  required Color ButtonColor ,  // required that is mean this paramter must not be Null
  required Color textColor,
  required Function? onpresssed,  // this mark ? for nullsaftey
  required String text,
  double? fontsize =30,  // this is Optional parameter

}){
  return  Container(
    height: 80,
    width: 80,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
    ),
    child: TextButton(
      onPressed: (){
        onpresssed!();
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor,
            fontSize: fontsize,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: ButtonColor
      ),
    ),
  );
}

Widget zeroButton ({
  required Function onpressed
}){
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(50),
    ),
    height: 80,
    width: 150,
    child: TextButton(
      onPressed: (){onpressed();},
      child: Text(
        "0",
        style: TextStyle(
            color: Colors.white,
            fontSize: 30
        ),
      ),
    ),
  );
}
