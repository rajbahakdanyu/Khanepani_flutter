import 'package:flutter/material.dart';

class FlightInputWidget extends StatefulWidget {
  const FlightInputWidget({Key? key}) : super(key: key);

  @override
  _FlightInputWidgetState createState() => _FlightInputWidgetState();
}

class _FlightInputWidgetState extends State<FlightInputWidget> {
  String _currentLocation = 'Eg. Kathmandu';
  String _destinationLocation = 'Eg. Pokhara';

  Widget airportFields(
      VoidCallback tapFunc, IconData fieldIcon, String location) {
    return GestureDetector(
      onTap: tapFunc,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  fieldIcon,
                  color: Colors.green,
                  size: 30,
                ),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget flightInputFields() {
    return Column(
      children: [
        airportFields(
          () => Navigator.pushNamed(context, '/airport'),
          Icons.arrow_upward,
          _currentLocation,
        ),
        SizedBox(height: 20),
        airportFields(
          () => Navigator.pushNamed(context, '/airport'),
          Icons.arrow_downward,
          _destinationLocation,
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
              String temp = _currentLocation;

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
