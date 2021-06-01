import 'package:flutter/material.dart';

class Detaintion extends StatefulWidget {
  @override
  _DetaintionState createState() => _DetaintionState();
}

class _DetaintionState extends State<Detaintion> {
  String type = 'Type';
  List size = ["20 GP", "40 HQ"];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.all(10),
      height: 50,
      
      child: Column(
       
        children: [
          Text("Detaintion Charges"),
        ],
      ),
    );
  }
}
