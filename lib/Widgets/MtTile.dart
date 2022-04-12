import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/Provider/provider.dart';

// ****** Title Design ******
class MyTile extends StatelessWidget {

  Titlee title;
  int indx;
  MyTile({Key? key ,required this.title , required this.indx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    return Consumer<provider>(builder: (context,pro,child){
      return Container(
        width: _width-(_width/2),
        height: _height-(_height*0.85),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: pro.index == indx ? [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          )]:[BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(0, 0), // changes position of shadow
          )],
         ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${pro.Lists[indx].length} Tasks"),
              Text(
                title.titleName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class Titlee{
  int numberOfTasks=0;
  final String titleName;
  Titlee({required this.titleName});

  void addNewTask(){
    numberOfTasks++;
  }
  void removeTask(){
    numberOfTasks--;
  }

}