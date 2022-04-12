import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:untitled3/Widgets/MyTask.dart';

class BusinessDatabase {

  static late Database database;
  static List<Task> businessData =[];


  static Future<void> creatDatabase()async{

    database = await openDatabase(
        'business.db',
        version: 2,
        onCreate: (database, version){
          print ("Database is created !! BusinessDatabase");
          database.execute(
              'CREATE TABLE business (id INTEGER PRIMARY KEY, name text, color INTEGER )'
          ).
          then((value) {
            print('TABLE IS CREATED !!');
          }).
          catchError((error){
            print(error.toString());
          });
        },
        onOpen: (database){
          print ('Database is open !! BusinessDatabase');
          getDate(database);
        }
    );
  }

  static Future<void> getDate(Database database) async{
    businessData.clear();
    database.rawQuery(
        'SELECT * FROM business'
    ).
    then((value) {
      value.forEach((element){
        int color = element['color'] as int;
        businessData.add(
            Task(
                name: element['name'] as String,
                color: Color(color),
                id: element['id'] as int,
            )
        );
      }
      );
      print('From getData function Length is : ${businessData.length} BusinessDatabase' );
    }).catchError((error){
      print("Errrrror");
    });
  }


  static Future<void> insertDatabase({required String name,required int color})async{

    database.rawInsert(
        'INSERT INTO business (name,color) VALUES ( ?,?)',[name,color]
    ).
    then((value) {
      print("Record $value is inserted !! BusinessDatabase");
      getDate(database);
    }).catchError((error){
      print ( error.toString());
    });
  }


  static void deleteDatabase(int id){
    database.rawDelete(
        'DELETE FROM business WHERE id = ?' ,[id]
    ).then((value){
      print("Task Deleted BusinessDatabase");
      print(value);
    }).catchError((error){
      print(error.toString());
    });
    getDate(database);
  }

  static void printData(){
    print("YES");
    print(businessData.length);
    //getDate(database);
    for(int i =0 ; i < businessData.length;i++){

      print(businessData[i].id);
      print(businessData[i].color);
      print(businessData[i].name);
    }
  }
}
