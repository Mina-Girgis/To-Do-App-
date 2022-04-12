import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/Provider/provider.dart';

Widget XButton(context)
{
  DateTime _myDAteTime;
  return Consumer<provider>(builder: (context,pro,child){
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        pro.ResetAllFunctions();
        Navigator.pop(context);
      },
      child: Container(
        width:30.0,
        height: 30.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white70,
              offset: Offset(0,3),
            ),
          ],
          borderRadius:BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black12,width:2.0,),
        ),
        child:Text(
          "X",
          style: TextStyle(fontWeight: FontWeight.bold,),
        ),
      ),
    );
  });
}
