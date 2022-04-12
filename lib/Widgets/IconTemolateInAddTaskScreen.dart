import 'package:flutter/material.dart';

Widget iconTemplate({required Icon icon})
{
  return Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      color: Colors.white60,
      borderRadius: BorderRadius.circular(30.0),
    ),

    child: icon,

  );
}