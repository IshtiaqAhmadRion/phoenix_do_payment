import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController sizeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

// ignore: unused_field
  String output = '';
  var size;
  var quantity;
  var total;
  var doc, ser, cln, thc, cmc, others;

  // ignore: non_constant_identifier_names
  void MultiplyQuantity() {
    size = int.parse(sizeController.text);
    quantity = int.parse(quantityController.text);
    if (size == 20) {
      doc = 3000;
      ser = 300;
      cln = 300;
      thc = 557;
      cmc = 1539;
      others = 4000;
      total = (doc + ser + cln + thc + cmc + others) * quantity;
    } else {
      doc = 3000;
      ser = 600;
      cln = 500;
      thc = 1253;
      cmc = 2052;
      others = 4000;
      total = (doc + ser + cln + thc + cmc + others) * quantity;
    }

    //total = (doc+ser+cln+thc+cmc+others);
    setState(() {
      output = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: sizeController,
              decoration: InputDecoration(
                hintText: 'Container type 20 or 40',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: quantityController,
              decoration: InputDecoration(
                hintText: 'Qantity',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,
                    )),
              ),
            ),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Text(
                "Submit",
                style: (TextStyle(fontSize: 20.00)),
              ),
              color: Color(0xff2D2D2D),
              textColor: Color(0xff0085CA),
              onPressed: () {
                MultiplyQuantity();
              }),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Total amount for $quantity x $size:',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                output,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
