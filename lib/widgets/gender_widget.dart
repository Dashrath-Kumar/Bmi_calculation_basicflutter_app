import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';


class Gender extends StatefulWidget{
  final Function(int) onChanges;

  const Gender ({super.key,
    required this.onChanges
  });

  @override
  State<Gender> createState()=>_GenderState();
}

class _GenderState extends State<Gender>{
  int _gender=1;

  final ChoiceChip3DStyle selectedStyle= ChoiceChip3DStyle(
  topColor: Colors.grey.shade300,
  backColor:Colors.grey,
  borderRadius: BorderRadius.circular(20)
  );

  final ChoiceChip3DStyle UnselectedStyle= ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor:Colors.grey.shade300,
      borderRadius: BorderRadius.circular(20)
  );



  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style:_gender==1? selectedStyle:UnselectedStyle,
            selected: _gender==1,
            onSelected: () {
              setState(() {
                _gender=1;
              });
              widget.onChanges(_gender);
            },
            onUnSelected: (){},
            child: Column(
              children: [
                Image.asset("assets/male.png",
                width: 50,
                fit: BoxFit.contain,
                ),
                SizedBox(height: 5,),
                Text("Male")
              ],
            ),
          ),
          SizedBox(width: 20,),
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style:_gender==2? selectedStyle:UnselectedStyle,
            selected: _gender==2,
            onSelected: () {
                setState(() {
                _gender=2;
                });
                widget.onChanges(_gender);
            },
            onUnSelected: (){},
            child: Column(
              children: [
                Image.asset("assets/female.png",
                  width: 50,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 5,),
                Text("Female")
              ],
            ),
          )
        ],

      ),
    );
  }
}

