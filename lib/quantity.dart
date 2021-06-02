import 'package:flutter/material.dart';

class QuantityTextFromField extends StatefulWidget {
  const QuantityTextFromField({Key key}) : super(key: key);

  @override
  _QuantityTextFromFieldState createState() => _QuantityTextFromFieldState();
}

class _QuantityTextFromFieldState extends State<QuantityTextFromField> {
  final quantityKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Form(
            key: quantityKey,
            child: TextFormField(
              validator: (value) {
                if (value.length < 1) {
                  return 'Please Enter Quantity';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(hintText: 'Quantity'),
            ),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Text(
                "Submit",
                style: (TextStyle(fontSize: 20.00)),
              ),
              color: Color(0xff2D2D2D),
              textColor: Color(0xff0085CA),
              onPressed: () {
                quantityKey.currentState.validate();
              }),
        ],
      ),
    );
  }
}
