import 'package:flutter/material.dart';
import 'package:phoenix_do_payment/quantity.dart';

class ContainerDetails extends StatefulWidget {
  @override
  _ContainerDetailsState createState() => _ContainerDetailsState();
}

class _ContainerDetailsState extends State<ContainerDetails> {
  String type;
  List size = ["20 GP", "40 HQ"];
  @override
  Widget build(BuildContext context) {
    //Total Column
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          //1st Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Row Padding
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: buildBoxDecoration(),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton(
                    hint: Text(
                      "Container Type",
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
              //Quantity in first row
            ],
          ),
          Container(
            child: QuantityTextFromField(),
          ),
          // ignore: deprecated_member_use
          
        ],
      ),
    );
  }

//Extared Method
  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.purple,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
