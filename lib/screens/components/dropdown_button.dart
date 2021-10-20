import 'package:flutter/material.dart';
import 'package:it_support/screens/components/text_field_container.dart';

class RoundedDropdownButton extends StatefulWidget {
  const RoundedDropdownButton({Key? key}) : super(key: key);

  @override
  RoundedDropdownButtonState createState() => RoundedDropdownButtonState();
}

class RoundedDropdownButtonState extends State<RoundedDropdownButton> {
  //first item
  String dropdownValue = 'Laptop';
  // To show Selected Item in Text.
  String holder = '';

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Column(children: <Widget>[
        DropdownButton<String>(
          style: const TextStyle(color: Colors.black),
          isExpanded: true,
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward, color: Colors.lightBlue),
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 2,
            color: Colors.lightBlue,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['PC', 'Laptop', 'Smart Phone']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
