import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';


class BmiScore extends StatefulWidget{
  final double bmiScore;
  final int age;
   String? bmiStatus;
   String? bmiInterpretation;
  Color? bmiStatusColor;

  BmiScore({super.key,
    required this.bmiScore,
    required this.age
  });
  @override
  State<BmiScore>createState()=>_BmiScoreState();

}
class _BmiScoreState extends State<BmiScore>{


  void setBmiInterpretation(){
    if(widget.bmiScore>30){
      widget.bmiStatus="Obese";
      widget.bmiInterpretation="Please work to reduce obesity";
      widget.bmiStatusColor=Colors.pink;
    }else if(widget.bmiScore>=25&&widget.bmiScore<=30){
      widget.bmiStatus="OverWeight";
      widget.bmiInterpretation="Do regular Excersie and Reduce weigh";
      widget.bmiStatusColor=Colors.orange;
    }else if(widget.bmiScore>=18.5&&widget.bmiScore<24.9){
      widget.bmiStatus="Normal";
      widget.bmiInterpretation="Congratulation! You are one of the fittest person";
      widget.bmiStatusColor=Colors.green;
    }else if(widget.bmiScore<18.5){
      widget.bmiStatus="UnderWeight";
      widget.bmiInterpretation="Try to increase your weight";
      widget.bmiStatusColor=Colors.red;
    }
  }


  Widget build(BuildContext context){
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        title:Text("BMI Score"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Card(
          margin: EdgeInsets.only(left: 10.0),
          elevation: 12,
          shape: RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Score",
              style: TextStyle(fontSize: 25,color: Colors.blue),
              ),
              SizedBox(height: 15.0,),
              PrettyGauge(
                gaugeSize: 200,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment("UnderWeight",18.5,Colors.red),
                  GaugeSegment("Normal",6.4,Colors.green),
                  GaugeSegment("OverWeight",5,Colors.orange),
                  GaugeSegment("Obse",10.1,Colors.pink),
                ],
                valueWidget: Text(
                  widget.bmiScore.toStringAsFixed(1),
                  style: TextStyle(fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                currentValue: widget.bmiScore.toDouble(),
                needleColor: Colors.blueAccent,
              ),
          SizedBox(height: 10.0,),
              Text(widget.bmiStatus!,
              style: TextStyle(fontSize: 20.0,color:widget.bmiStatusColor!)
              ),
              SizedBox(height: 10.0,),
              Text(widget.bmiInterpretation!,
                  style: TextStyle(fontSize: 20.0,),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      child:Text("Re-Calculate"),
                  ),
                  SizedBox(width: 10.0,),
                  ElevatedButton(onPressed: (){
                    Share.share(
                      "Your BMI is ${widget.bmiScore.toStringAsFixed(1)}at age ${widget.age}"
                    );
                  },
                    child:Text("Share"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}

