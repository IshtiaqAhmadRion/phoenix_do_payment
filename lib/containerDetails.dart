import 'package:flutter/material.dart';
//import 'package:phoenix_do_payment/quantity.dart';

class ContainerDetails extends StatefulWidget {
  @override
  _ContainerDetailsState createState() => _ContainerDetailsState();
}

class _ContainerDetailsState extends State<ContainerDetails> {
  String type, output;

  int c = 0;
  var quantity;

  var doc, ser, cln, thc, cmc, others, total;
  List size = ["20 GP", "40 HQ"];

  final quantityKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    //Total Column
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //1st Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  //Row Padding
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: screenWidth / 6,
                      decoration: buildBoxDecoration(),
                      padding: EdgeInsets.only(left: 10, right: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DropdownButton(
                          hint: Text(
                            "Container Type",
                            textAlign: TextAlign.center,
                          ),
                          value: type,
                          onChanged: (newValue) {
                            setState(() {
                              type = newValue;
                              // ignore: unrelated_type_equality_checks
                              if (type == '20 GP') {
                                c = 1;
                              } else if (type == '40 HQ') {
                                c = 2;
                              }
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
                  ),
                  //Quantity
                  Container(
                    // padding: EdgeInsets.only(left: 10, right: 10),
                    width: screenWidth / 7,
                    child: Form(
                      key: quantityKey,
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.parse(value) == 0) {
                            return 'Please Enter Quantity';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (text) {
                          quantity = int.parse(text);
                        },
                        decoration: InputDecoration(
                          hintText: 'Quantity',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green[600])),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green[600])),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // ignore: deprecated_member_use
                  
                  //Button Column start
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth / 7,
                          // ignore: deprecated_member_use
                          child:
                  
                              // ignore: deprecated_member_use
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  child: Text(
                                    "Submit",
                                    style: (TextStyle(
                                        fontSize: 20.00,
                                        fontWeight: FontWeight.bold)),
                                  ),
                                  color: Colors.green[600],
                                  textColor: Colors.black,
                                  onPressed: () {
                                    quantityKey.currentState.validate();
                                    dropdownSelecoton();
                                  }),
                        ),
                        Container(
                          width: screenWidth / 7,
                          // ignore: deprecated_member_use
                          child:
                  
                              // ignore: deprecated_member_use
                              Padding(
                            padding: const EdgeInsets.only(top: 10),
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                child: Text(
                                  "Witout other Charges",
                                  textAlign: TextAlign.center,
                                 
                                  style: (TextStyle(
                                      fontSize: 20.00,color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                                ),
                                color: Colors.green[600],
                                textColor: Colors.black,
                                onPressed: () {
                                  quantityKey.currentState.validate();
                                  total = total - others;
                  
                                  setState(() {
                                    output = total.toString();
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Button Column end
                  
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Total amount for $quantity x $type : $output',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  void dropdownSelecoton() {
    if (c == 1) {
      doc = 3000;
      others = 4000;
      ser = 300;
      cln = 300;
      thc = 557;
      cmc = 1539;
      total = (ser + cln + thc + cmc + others) * quantity;
      total = total + doc;
      setState(() {
        output = total.toString();
      });
    }
    if (c == 2) {
      doc = 3000;
      others = 4000;
      ser = 500;
      cln = 600;
      thc = 2052;
      cmc = 1253;
      total = (ser + cln + thc + cmc + others) * quantity;
      total = total + doc;

      setState(() {
        output = total.toString();
      });
    }
  }
}
