import 'package:flutter/material.dart';
import 'package:khanepani/widgets/flight_input_widget.dart';

class OneWayFlight extends StatefulWidget {
  const OneWayFlight({Key? key}) : super(key: key);

  @override
  _OneWayFlightState createState() => _OneWayFlightState();
}

class _OneWayFlightState extends State<OneWayFlight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlightInputWidget(),
      ],
    );
  }
}
