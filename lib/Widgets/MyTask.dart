import 'package:flutter/material.dart';
import 'MyCheckBox.dart';


class MyTask extends StatelessWidget {

  Task task;
  MyTask({Key? key,required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(
        constraints: BoxConstraints(
          minHeight:70.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                MyCheckBox(task.value, task.color),
                SizedBox(width: 20.0,),
                Expanded(
                  child: Text(
                    task.name,
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 20.0,
                      decoration: task.value == true ? TextDecoration.lineThrough:TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Task{
  int id;
  final String name;
  bool value=false;
  final Color color;
  Task({required this.name,required this.color, this.value=false,this.id=0});

  void ChangeValue(){
    value=!value;
  }

}