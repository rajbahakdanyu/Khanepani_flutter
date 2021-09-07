import 'package:flutter/material.dart';
import 'package:khanepani/providers/passenger_provider.dart';
import 'package:provider/provider.dart';

class CounterInputWidget extends StatefulWidget {
  CounterInputWidget({
    Key? key,
    this.minimum = 0,
    this.pType = 'Adult',
  }) : super(key: key);

  int minimum;
  String pType;

  @override
  _CounterInputWidgetState createState() => _CounterInputWidgetState();
}

class _CounterInputWidgetState extends State<CounterInputWidget> {
  late String pType;

  @override
  void initState() {
    super.initState();
    pType = widget.pType;
  }

  @override
  Widget build(BuildContext context) {
    final passenger = Provider.of<PassengerProvider>(context);

    return Container(
      child: Row(
        children: [
          Container(
            height: 55,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Consumer<PassengerProvider>(
                builder: (context, passenger, child) {
                  return Text(
                    pType == 'Adult'
                        ? passenger.adult.toString()
                        : passenger.child.toString(),
                    style: TextStyle(fontSize: 18),
                  );
                },
              ),
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  pType == "Adult"
                      ? passenger.increaseAdult()
                      : passenger.increaseChild();
                },
                icon: Icon(Icons.keyboard_arrow_up),
              ),
              IconButton(
                onPressed: () {
                  if (pType == "Adult") {
                    if (passenger.adult > widget.minimum) {
                      passenger.decreaseAdult();
                    }
                  } else {
                    if (passenger.child > widget.minimum) {
                      passenger.decreaseChild();
                    }
                  }
                },
                icon: Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
