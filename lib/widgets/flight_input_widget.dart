import 'package:flutter/material.dart';

class FlightInputWidget extends StatefulWidget {
  const FlightInputWidget({Key? key}) : super(key: key);

  @override
  _FlightInputWidgetState createState() => _FlightInputWidgetState();
}

class _FlightInputWidgetState extends State<FlightInputWidget> {
  TextEditingController _currentLocation = new TextEditingController();
  TextEditingController _destinationLocation = new TextEditingController();

  Widget flightInputFields() {
    return Column(
      children: [
        TextField(
          controller: _currentLocation,
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
          controller: _destinationLocation,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          flightInputFields(),
          FloatingActionButton(
            onPressed: () {
              TextEditingController temp = _currentLocation;

              setState(() {
                _currentLocation = _destinationLocation;
                _destinationLocation = temp;
              });
            },
            child: Icon(
              Icons.height,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
