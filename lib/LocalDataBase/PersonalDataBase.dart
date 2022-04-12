import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:untitled3/Widgets/MyTask.dart';

class PersonalDatabase {

  static late Database database;
  static List<Task> personalData =[];


  static Future<void> creatDatabase()async{

    database = await openDatabase(
        'personal.db',
        version: 2,
        onCreate: (database, version){
          print ("Database is created !! PersonalDatabase");
          database.execute(
              'CREATE TABLE personal (id INTEGER PRIMARY KEY, name text , color INTEGER )'
          ).
          then((value) {
            print('TABLE IS CREATED !! PersonalDatabase');
          }).
          catchError((error){
            print(error.toString());
          });
        },
        onOpen: (database){
          print ('Database is open !! PersonalDatabase');
          getDate(database);
        }
    );
  }

  static Future<void> getDate(Database database) async{
    personalData.clear();
    database.rawQuery(
        'SELECT * FROM personal'
    ).
    then((value) {
      value.forEach((element){
        int color = element['color'] as int;
        personalData.add(
            Task(
                name: element['name'] as String,
                color: Color(color),
                id: element['id'] as int,
            )
        );
      }
      );
      print('From getData function Length is : ${personalData.length} PersonalDatabase');
    }).catchError((error){
      print(error.toString());
    });
  }


  static Future<void> insertDatabase({required String name,required int color})async{

    database.rawInsert(
        'INSERT INTO personal (name,color) VALUES ( ?, ?)',[name,color]
    ).
    then((value) {
      print("Record $value is inserted !! PersonalDatabase");
      getDate(database);
    }).catchError((error){
      print ( error.toString());
    });
  }


  static void deleteDatabase(int id){
    database.rawDelete(
        'DELETE FROM personal WHERE id = ?' ,[id]
    ).then((value){
      print("Task Deleted PersonalDatabase");
      print(value);
    }).catchError((error){
      print(error.toString());
    });
    getDate(database);
  }


}



/*
	WidgetsFlutterBinding.ensureInitialized();
  SandwichDatabase.creatDatabase();

*/