import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/LocalDataBase/BusinessDataBase.dart';
import 'package:untitled3/LocalDataBase/OtherDataBase.dart';
import 'package:untitled3/LocalDataBase/PersonalDataBase.dart';
import 'package:untitled3/Provider/provider.dart';
import 'package:untitled3/Widgets/MtTile.dart';
import 'package:untitled3/Widgets/MyCheckBox.dart';
import 'package:untitled3/Widgets/MyTask.dart';

import 'NewTaskScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.black26 , size: 30.0,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8.0,15.0,8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search ,size: 30.0 ,color: Colors.black26),
                SizedBox(width: 15.0,),
                Icon(IconData(0xef52, fontFamily: 'MaterialIcons'),size: 30.0 ,color: Colors.black26),
              ],
            ),
          )
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,40.0,0.0,0.0),
          child: Container(
            width: _width-(_width/10),
            height: _height,
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.black,width: 5.0,),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's up, Joy!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  Text(
                    "CATEGORIES",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Consumer<provider>(builder: (context,pro,child){
                    return Container(
                      width: _width,
                      height: _height-(_height*0.85),
                      child: Consumer<provider>(builder: (context,pro,child){
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: pro.myTitleList.length,
                          itemBuilder: (context,index){
                            return InkWell(
                              borderRadius: BorderRadius.circular(30.0),
                              onTap: (){
                                pro.ChangeList(index);
                                pro.ChangeIndex(index);
                                print('Section ${pro.index} Is Active Now');
                              },
                              child: MyTile(title: pro.myTitleList[index],indx:index),
                            );
                          },
                        );
                      },),
                    );
                  }),
                  SizedBox(height: 25.0,),
                  Text(
                    "TODAY'S TASKS",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  
                  Container(
                    width: _width,
                    height: _height,
                    child: Consumer<provider>(builder: (context,pro,child){
                      return ListView.builder(
                        itemCount: pro.MyList.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            borderRadius: BorderRadius.circular(30.0),
                            onTap: (){
                                pro.ChangeCheckValue(index);
                                Future.delayed(Duration(seconds: 2),(){
                                  if(pro.index==0){
                                    BusinessDatabase.deleteDatabase(pro.MyList[index].id);
                                  }
                                  else if(pro.index==1){
                                    PersonalDatabase.deleteDatabase(pro.MyList[index].id);
                                  }
                                  else{
                                    OtherDatabase.deleteDatabase(pro.MyList[index].id);
                                  }
                                  setState(() {}); // to reload
                                }
                                );
                            },
                            child: MyTask(task:pro.MyList[index]),
                          );
                        },
                      );
                    },),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BusinessDatabase.printData();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewTask()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}