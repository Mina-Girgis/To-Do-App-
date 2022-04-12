import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MyCheckBox(bool value , Color color)
{
   return Container(
     decoration: BoxDecoration(
       border:Border.all(color:color,width: 3.0),
       borderRadius: BorderRadius.circular(30.0),
     ),
     width:30.0,
     height: 30.0,
     child: Checkbox(
       activeColor: color,
       side: BorderSide(width: 0.0,style: BorderStyle.none),
       value: value, onChanged: (value){},
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(30.0),
       ),
     ),
   );
}