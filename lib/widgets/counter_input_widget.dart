import 'package:flutter/material.dart';

class CounterInputWidget extends StatefulWidget {
  CounterInputWidget({
    Key? key,
    this.initial = 0,
    this.minimum = 0,
    this.pType = 'Adult',
  }) : super(key: key);

  int initial;
  int minimum;
  String pType;

  @override
  _CounterInputWidgetState createState() => _CounterInputWidgetState();
}

class _CounterInputWidgetState extends State<CounterInputWidget> {
  late int value;
  late String pType;

  @override
  void initState() {
    super.initState();
    value = widget.initial;
    pType = widget.pType;
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                value.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    value++;
                  });
                },
                icon: Icon(Icons.keyboard_arrow_up),
              ),
              IconButton(
                onPressed: () {
                  if (value > widget.minimum)
                    setState(() {
                      value--;
                    });
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
