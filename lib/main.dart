import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocalDataBase/BusinessDataBase.dart';
import 'LocalDataBase/OtherDataBase.dart';
import 'LocalDataBase/PersonalDataBase.dart';
import 'Provider/provider.dart';
import 'Screens/Home.dart';
import 'Screens/NewTaskScreen.dart';
import 'Screens/colorPickerScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BusinessDatabase.creatDatabase();
  OtherDatabase.creatDatabase();
  PersonalDatabase.creatDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context)=>provider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Home(),
        ),
    );
  }
}









