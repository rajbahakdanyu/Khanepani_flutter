import 'package:flutter/material.dart';

class FlightInputWidget extends StatefulWidget {
  const FlightInputWidget({Key? key}) : super(key: key);

  @override
  _FlightInputWidgetState createState() => _FlightInputWidgetState();
}

class _FlightInputWidgetState extends State<FlightInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.arrow_upward),
              hintText: 'Eg. Kathmandu',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.arrow_downward),
              hintText: 'Eg. pokhara',
            ),
          ),
        ],
      ),
    );
  }
}
