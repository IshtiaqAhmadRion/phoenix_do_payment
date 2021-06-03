import 'package:flutter/material.dart';
//import 'package:phoenix_do_payment/quantity.dart';

class ContainerDetails extends StatefulWidget {
  @override
  _ContainerDetailsState createState() => _ContainerDetailsState();
}

class _ContainerDetailsState extends State<ContainerDetails> {
  String type;
  List size = ["20 GP", "40 HQ"];

  final quantityKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    //Total Column
    return Center(
      child: Column(
        children: [
          //1st Row
          Row(
            children: [
              //Row Padding
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: screenWidth / 7,
                  decoration: buildBoxDecoration(),
                  padding: EdgeInsets.only(left: 10, right: 15),
                  child: DropdownButton(
                    hint: Text(
                      "Container Type",
                      textAlign: TextAlign.center,
                    ),
                    value: type,
                    onChanged: (newValue) {
                      setState(() {
                        type = newValue;
                      });
                    },
                    items: size.map((sizeItem) {
                      return DropdownMenuItem(
                        value: sizeItem,
                        child: Text(
                          sizeItem,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              //Quantity
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: screenWidth / 7,
                child: Form(
                  key: quantityKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 1) {
                        return 'Please Enter Quantity';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Quantity',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[600])),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green[600])
                          ),

                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              // ignore: deprecated_member_use
              Container(
                width: screenWidth / 7,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: Text(
                      "Submit",
                      style: (TextStyle(fontSize: 20.00)),
                    ),
                    color: Color(0xff2D2D2D),
                    textColor: Color(0xff0085CA),
                    onPressed: () {
                      quantityKey.currentState.validate();
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

//Extarct Method
  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.green[600],
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
