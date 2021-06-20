import 'package:flutter/material.dart';

class Detaintion extends StatefulWidget {
  @override
  _DetaintionState createState() => _DetaintionState();
}

class _DetaintionState extends State<Detaintion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        color: Colors.red.shade900,
        height: 50,
        //height: MediaQuery.of(context).size.height / 2,
        child: Scaffold(body:
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text("Detaintio charge ",
          
                textAlign: TextAlign.center,),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
