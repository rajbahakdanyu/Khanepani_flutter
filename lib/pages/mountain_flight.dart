import 'package:flutter/material.dart';
import 'package:khanepani/widgets/depature_input_widget.dart';

class MountainFlight extends StatefulWidget {
  const MountainFlight({Key? key}) : super(key: key);

  @override
  _MountainFlightState createState() => _MountainFlightState();
}

class _MountainFlightState extends State<MountainFlight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        DepatureInputWidget(),
      ],
    );
  }
}
