import 'package:flutter/material.dart';
import 'package:khanepani/widgets/input_fields_widget.dart';

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
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          InputFieldWidget(),
          FloatingActionButton(
            onPressed: () {},
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
