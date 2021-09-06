import 'package:flutter/material.dart';

import 'package:khanepani/widgets/water_counter_widget.dart';

class DepatureWidget extends StatefulWidget {
  const DepatureWidget({Key? key}) : super(key: key);

  @override
  _DepatureWidgetState createState() => _DepatureWidgetState();
}

class _DepatureWidgetState extends State<DepatureWidget> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          WaterCounterWidget(
            title: 'Tue, 7 Sept',
            tapFunction: () => _selectDate(context),
          ),
          SizedBox(height: 30),
          WaterCounterWidget(
            title: '1 Traveller',
            tapFunction: () {},
          ),
          SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.07,
              ),
            ),
            onPressed: () {},
            child: Text('Find Flights'),
          ),
        ],
      ),
    );
  }
}
