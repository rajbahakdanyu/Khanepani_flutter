import 'package:flutter/material.dart';

class WaterCounterWidget extends StatefulWidget {
  WaterCounterWidget({
    Key? key,
    this.tapFunction,
    this.title = 'Select',
  }) : super(key: key);

  final VoidCallback? tapFunction;
  String title;

  @override
  _WaterCounterWidgetState createState() => _WaterCounterWidgetState();
}

class _WaterCounterWidgetState extends State<WaterCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tapFunction,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                size: 30,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
