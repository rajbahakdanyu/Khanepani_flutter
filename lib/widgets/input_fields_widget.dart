import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusColor: Colors.grey.shade200,
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: Icon(Icons.arrow_upward),
            hintText: 'Eg. Kathmnadu',
          ),
          cursorHeight: 25,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusColor: Colors.grey.shade200,
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: Icon(Icons.arrow_downward),
            hintText: 'Eg. Pokhara',
          ),
          cursorHeight: 25,
        ),
      ],
    );
  }
}
