import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/Provider/provider.dart';
class ColPicker extends StatefulWidget {
  const ColPicker({Key? key}) : super(key: key);

  @override
  _ColPickerState createState() => _ColPickerState();
}

class _ColPickerState extends State<ColPicker> {
  @override
  Color mainColor=Colors.blue;
  Widget build(BuildContext context) {
    return Consumer<provider>(builder: (context,pro,child){
      return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80.0,),
              AlertDialog(
                backgroundColor: Colors.white,
                title: Text("Pick a color!"),
                content: SingleChildScrollView(
                  child: ColorPicker(
                      pickerColor: mainColor,
                      onColorChanged: (color)=>mainColor=color),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    pro.ChangeColorOfColorPicker(mainColor);
                    print(pro.colorOfColorPicker);
                    Navigator.pop(context);
                  },
                  child: Text("Okay!")
              ),

            ],
          ),
        ),
      );
    });
  }
}
