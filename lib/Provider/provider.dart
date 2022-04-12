import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/LocalDataBase/BusinessDataBase.dart';
import 'package:untitled3/LocalDataBase/OtherDataBase.dart';
import 'package:untitled3/LocalDataBase/PersonalDataBase.dart';
import 'package:untitled3/Widgets/MtTile.dart';
import 'package:untitled3/Widgets/MyTask.dart';

class provider extends ChangeNotifier{

    int index = 0;          // Which Section
    Color colorOfColorPicker = Colors.blue;
    dynamic date = DateTime.now();
    dynamic today="Today";
    List<Task>MyList=[];

    List< List<Task> > Lists =[
      BusinessDatabase.businessData, // Business
      PersonalDatabase.personalData, // Personal
      OtherDatabase.otherData, // Other
    ];

    List<Titlee>myTitleList = [
      Titlee(titleName: "Business"),
      Titlee(titleName: "Personal"),
      Titlee(titleName: "Other"),
    ];

    provider(){
      MyList=Lists[0];
    }

    // void TaskIncrement(){
    //   myTitleList[index].addNewTask();
    //   notifyListeners();
    // } // for Containers
    // void Taskdecrement(){
    //   myTitleList[index].removeTask();
    //   notifyListeners();
    // }


    void ChangeList(int index){
      MyList=Lists[index];
       notifyListeners();
    }
    void ChangeIndex(int x){
      index = x;
      notifyListeners();
    }

    //
    // void DeleteItem(int x){
    //   Lists[index].removeAt(x);
    //   MyList=Lists[index];
    //   print("Removed");
    //   notifyListeners();
    // }

    // void AddItem(Task T){
    //   Lists[index].add(Task(name: T.name, color: T.color));
    //   notifyListeners();
    // }


    void ChangeColorOfColorPicker(Color color){
      colorOfColorPicker=color;
      notifyListeners();
    }
    void ResetColorPicker(){
      colorOfColorPicker=Colors.blue;
      notifyListeners();
    }


    void ChangeDate(DateTime t){
      date = t;
      notifyListeners();
    }
    void ResetDate(){
      date = DateTime.now();
      notifyListeners();
    }
    void DayName(){
      if(date.day==DateTime.now().day && date.month==DateTime.now().month && date.year==DateTime.now().year)today="Today";
      else today = "${date.day} / ${date.month}";
      notifyListeners();
    }

    void ChangeCheckValue(int num){
      Lists[index][num].ChangeValue();
      notifyListeners();
    }

    void ResetAllFunctions(){
      ResetColorPicker();
      ResetDate();
      DayName();
      notifyListeners();
    }

}