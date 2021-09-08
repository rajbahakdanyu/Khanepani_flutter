import 'package:flutter/material.dart';
import 'package:khanepani/providers/passenger_provider.dart';

import 'package:khanepani/widgets/depature_input_widget.dart';
import 'package:khanepani/widgets/flight_input_widget.dart';
import 'package:provider/provider.dart';

class OneWayFlight extends StatefulWidget {
  const OneWayFlight({Key? key}) : super(key: key);

  @override
  _OneWayFlightState createState() => _OneWayFlightState();
}

class _OneWayFlightState extends State<OneWayFlight> {
  @override
  void initState() {
    super.initState();
    Provider.of<PassengerProvider>(context, listen: false).initPassengers();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<PassengerProvider>(context, listen: false).initPassengers();

    return Column(
      children: [
        SizedBox(height: 30),
        FlightInputWidget(),
        SizedBox(height: 20),
        DepatureInputWidget(),
      ],
    );
  }
}
