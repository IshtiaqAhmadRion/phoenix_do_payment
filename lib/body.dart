import 'package:flutter/material.dart';
import 'package:phoenix_do_payment/detaintion.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController sizeController20 = TextEditingController();
  TextEditingController sizeController40 = TextEditingController();

  TextEditingController quantityController = TextEditingController();

// ignore: unused_field
  String output = '';
  var size20;
  var size40;
  var quantity;
  var total;
  var doc, ser, cln, thc, cmc, others;

  // ignore: non_constant_identifier_names
  void MultiplyQuantity() {
    size20 = int.parse(sizeController20.text);
    quantity = int.parse(quantityController.text);

    if (size20 == 20) {
      doc = 3000;
      ser = 300;
      cln = 300;
      thc = 557;
      cmc = 1539;
      others = 4000;
      total = (ser + cln + thc + cmc + others) * quantity;
      total = total + doc;

      //total = (doc+ser+cln+thc+cmc+others);
      setState(() {
        
        output = total.toString();
      });
    } else {
      total = 0;
      setState(() {
        output = 'Please Enter Valid Container Number';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          //for 20' input textfield

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              maxLength: 2,
              controller: sizeController20,
              decoration: InputDecoration(
                hintText: 'Container type 20',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,
                    )),
              ),
            ),
          ),

          //for 40' input textfield
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: sizeController40,
              decoration: InputDecoration(
                hintText: 'Please Enter Container type 40',
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
                'Total amount for $quantity x $size20:',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                output,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green.shade800,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                  padding: EdgeInsetsDirectional.all(10),
                  child: Text(
                    'Without Other charges',
                    style:
                        TextStyle(fontSize: 15, color: Colors.purple.shade900),
                  ),
                  onPressed: () {
                    var oc = int.parse(output) - 4000;
                    setState(() {
                      output = oc.toString();
                    });
                  })
            ],
          ),
          Container(
            child: Detaintion(),
          )
        ],
      ),
    );
  }
}
