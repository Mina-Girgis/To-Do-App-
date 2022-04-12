import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:untitled3/Widgets/MyTask.dart';

class OtherDatabase {

  static late Database database;
  static List<Task> otherData =[];


  static Future<void> creatDatabase()async{

    database = await openDatabase(
        'other.db',
        version: 2,
        onCreate: (database, version){
          print ("Database is created !! OtherDatabase");
          database.execute(
              'CREATE TABLE other (id INTEGER PRIMARY KEY, name text, color INTEGER )'
          ).
          then((value) {
            print('TABLE IS CREATED !! OtherDatabase');
          }).
          catchError((error){
            print(error.toString());
          });
        },
        onOpen: (database){
          print ('Database is open !! OtherDatabase');
          getDate(database);
        }
    );
  }

  static Future<void> getDate(Database database) async{
    otherData.clear();
    database.rawQuery(
        'SELECT * FROM other'
    ).
    then((value) {
      value.forEach((element){
        int color = element['color'] as int;
        otherData.add(
            Task(
                name: element['name'] as String,
                color: Color(color),
                id: element['id'] as int,
            )
        );
      }
      );
      print('From getData function Length is : ${otherData.length} OtherDatabase');
    }).catchError((error){
      print(error.toString());
    });
  }


  static Future<void> insertDatabase({required String name,required int color})async{

    database.rawInsert(
        'INSERT INTO other (name,color) VALUES ( ? ,?)',[name,color]
    ).
    then((value) {
      print("Record $value is inserted !! OtherDatabase");
      getDate(database);
    }).catchError((error){
      print ( error.toString());
    });
  }

  static void deleteDatabase(int id){
    database.rawDelete(
        'DELETE FROM other WHERE id = ?' ,[id]
    ).then((value){
      print("Task Deleted OtherDatabase");
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