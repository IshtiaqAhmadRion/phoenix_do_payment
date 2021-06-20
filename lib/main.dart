import 'package:flutter/material.dart';
import 'package:phoenix_do_payment/containerDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextFields(),);
  }
}



class TextFields extends StatefulWidget {
  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DO Collection Cost"
        ),
      ),
      body: ContainerDetails(),
      
    );
  }
}