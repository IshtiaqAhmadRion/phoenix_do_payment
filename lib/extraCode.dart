// DropdownButton(
//             itemHeight: 10,
//             hint: Text('Select Item'),
            
//             value: type,
//             onChanged: (newValue) {
//               setState(() {
//                 type = newValue;
//               });
//             },
//             items: size.map((valueItem) {
//               return DropdownMenuItem(
//                 value: valueItem,
//                 child: Text(valueItem),
//               );
//             }).toList(),
//           )




//2nd way
          // new DropdownButton<String>(
          //   hint: Text("Select Item"),
          //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
          //     return new DropdownMenuItem<String>(
          //       value: value,
          //       child: new Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (String newValue) {
          //     setState(() {
          //       type = newValue;
          //     });
          //   },
          // )