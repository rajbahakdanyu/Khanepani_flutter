import 'package:flutter/material.dart';

class CounterInputWidget extends StatefulWidget {
  const CounterInputWidget({Key? key}) : super(key: key);

  @override
  _CounterInputWidgetState createState() => _CounterInputWidgetState();
}

class _CounterInputWidgetState extends State<CounterInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello'),
    );
  }
}
