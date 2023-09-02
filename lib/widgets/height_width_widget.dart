import 'package:flutter/material.dart';

class HeightandWeight extends StatefulWidget{
  final Function(int) onChaged;

  const HeightandWeight({super.key, required this.onChaged});

  @override
  State<HeightandWeight> createState()=>_HeightandWeightState();

}
class _HeightandWeightState extends State<HeightandWeight>{
  int _height=150;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            Text("Height",style: TextStyle(fontSize: 25,color: Colors.grey),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toString(),
                  style: TextStyle(fontSize: 40.0),
                ),
                SizedBox(width: 10,),
                Text("cm",
                style: TextStyle(fontSize: 20,color: Colors.grey),
                )
              ],
            ),
            Slider(
              min: 0,
                max:250,
                value:_height.toDouble(),
                thumbColor: Colors.blue,
                onChanged: (value){
                setState(() {
                  _height=value.toInt();
                });
                widget.onChaged(_height);
                }
            ),
          ],
        ),
      ),
    );
  }
}