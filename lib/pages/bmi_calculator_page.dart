import 'dart:math';
import 'package:bmi_calculator/pages/score_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../widgets/ageweight_widget.dart';
import '../widgets/gender_widget.dart';
import '../widgets/height_width_widget.dart';

class BmiCalculatorPage extends StatefulWidget{
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState()=>_BmiCalculatorPageState();

}

class _BmiCalculatorPageState extends State<BmiCalculatorPage>{
  int _gender=0;
  int _height=150;
  int _age=30;
  int _weight=50;
  bool _isFinished=false;
  double _bmiScore=0;

  void calculateBMI(){
    _bmiScore=_weight/pow(_height/100,2);

  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Body Mass Index (BMI) Calculator",
          style:TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 5.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Gender(onChanges: (genderVale) {
                  _gender=genderVale;
                },
                ),
                SizedBox(height: 50,),
                HeightandWeight(onChaged: (heightVal) {
                  _height=heightVal;
                  },
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeight(onChanged: (ageVale ) {
                      _age=ageVale;
                    },
                      title: "Age",
                      initValue: 30,
                      min: 0,
                      max:100,
                    ),
                    AgeWeight(onChanged: (weightVale ) {
                      _weight=weightVale;
                    },
                      title: "Weight(Kg)",
                      initValue: 50,
                      min: 0,
                      max:200,
                    ),
                  ],
                ),
                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                  child: SwipeableButtonView(
                    //require this bool condition
                    isFinished: _isFinished,
                     onFinish: ()async{
                      await Navigator.push(context,
                        //page transition prperty
                        PageTransition(
                            child:BmiScore(
                              bmiScore:_bmiScore,
                            age:_age
                            ) ,
                            type:PageTransitionType.fade
                        ));
                      setState(() {
                         _isFinished=false;
                       });

                     },
                      onWaitingProcess: (){
                      //to calculate BM
                        calculateBMI();
                        Future.delayed(Duration(seconds: 1),(){
                          setState(() {
                            _isFinished=true;
                          });
                        }
                        );
                      },
                      activeColor:Colors.blue,
                      buttonWidget:Icon(
                          Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      buttonText:"Calculate",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
