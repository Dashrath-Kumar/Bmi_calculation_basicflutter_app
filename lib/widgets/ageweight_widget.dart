import 'package:flutter/material.dart';


class AgeWeight extends StatefulWidget{
  final Function (int) onChanged;
  final String title;
  final int initValue;
  final int min;
  final int max;


  const AgeWeight({super.key,
    required this.onChanged,
    required this.title,
    required this.initValue,
    required this.min,
    required this.max
  });
  @override
  State<AgeWeight> createState()=>_AgeWeightState();
}

class _AgeWeightState extends State<AgeWeight>{
  int counter=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter=widget.initValue;
  }

  @override
  Widget build(BuildContext context){
    return Padding(
        padding:EdgeInsets.all(8),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 20.0,color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(counter>widget.min){
                          counter--;
                        }
                      });
                      widget.onChanged(counter);
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.remove,color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  //to show the no increasing and decrasing in between
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,fontSize: 22,
                      fontWeight:FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 15.0),
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(counter<widget.max){
                          counter++;
                        }
                      });
                      widget.onChanged(counter);
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),

    );
  }

}