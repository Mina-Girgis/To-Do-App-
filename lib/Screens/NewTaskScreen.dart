import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/LocalDataBase/BusinessDataBase.dart';
import 'package:untitled3/LocalDataBase/OtherDataBase.dart';
import 'package:untitled3/LocalDataBase/PersonalDataBase.dart';
import 'package:untitled3/Provider/provider.dart';
import 'package:untitled3/Widgets/IconTemolateInAddTaskScreen.dart';
import 'package:untitled3/Widgets/MyCheckBox.dart';
import 'package:untitled3/Widgets/MyCheckBox.dart';
import 'package:untitled3/Widgets/MyTask.dart';
import 'package:untitled3/Widgets/XButton.dart';

import 'colorPickerScreen.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    DateTime _myDAteTime=DateTime.now();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    TextEditingController _myInput = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar:AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        // ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 5.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      XButton(context),
                    ],
                  ),
                  SizedBox(height: _height * (16 / 100),),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: TextFormField(
                      controller: _myInput,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Create a new template",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Consumer<provider>(builder: (context,pro,child){
                          return InkWell(
                            onTap: () async {
                              pro.date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2130),
                              ))!;
                              pro.DayName();
                            },
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: Colors.black12, width: 2.0,),
                                color: Colors.white60,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Consumer<provider>(builder: (context,pro,child){
                                    return Row(
                                      children: [
                                        Icon(IconData(
                                            0xefa5, fontFamily: 'MaterialIcons'),
                                            color: Colors.black26),
                                        SizedBox(width: 5.0),
                                        Text(pro.today),
                                      ],
                                    );
                                  },),
                                ),
                              ),
                            ),
                          );
                        }),
                        SizedBox(width: 20.0,),
                        Consumer<provider>(builder: (context,pro,child){
                          return InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ColPicker()));
                            },
                            child: Container(
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: Colors.black12, width: 2.0,),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(
                                      color: pro.colorOfColorPicker, width: 2.0,),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: Colors.black12, width: 2.0,),
                                        color: pro.colorOfColorPicker,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * (12 / 100),),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        iconTemplate(icon: Icon(IconData(
                            0xee41, fontFamily: 'MaterialIcons'), size: 35.0,
                            color: Colors.black26)),
                        iconTemplate(icon: Icon(IconData(
                            0xee9e, fontFamily: 'MaterialIcons'), size: 35.0,
                            color: Colors.black26)),
                        iconTemplate(icon: Icon(IconData(
                            0xeecb, fontFamily: 'MaterialIcons'), size: 35.0,
                            color: Colors.black26)),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * (10 / 100),),
                  Consumer<provider>(builder: (context,pro,child){
                    return Align(
                      alignment: Alignment.bottomRight,
                      heightFactor: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ButtonTheme(
                          minWidth: 180.0,
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {

                                //Task T =Task(name:_myInput.text,color:pro.colorOfColorPicker);
                                print(pro.colorOfColorPicker.value);
                                if(pro.index==0) {
                                  BusinessDatabase.insertDatabase(
                                    name: _myInput.text,
                                    color: pro.colorOfColorPicker.value,
                                  );
                                }
                                else if(pro.index==1){
                                  PersonalDatabase.insertDatabase(
                                    name: _myInput.text,
                                    color: pro.colorOfColorPicker.value,
                                  );
                                }
                                else{
                                  OtherDatabase.insertDatabase(
                                    name: _myInput.text,
                                    color: pro.colorOfColorPicker.value,
                                  );
                                }
                                setState(() {});
                                // pro.AddItem(T);
                                // pro.TaskIncrement();
                                // pro.ResetAllFunctions();
                                Navigator.pop(context);
                              },
                            child: Text(
                              "New task   >",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Color.fromRGBO(0, 36, 250, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






