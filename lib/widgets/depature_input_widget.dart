import 'package:flutter/material.dart';

import 'package:khanepani/widgets/counter_input_widget.dart';
import 'package:khanepani/widgets/water_counter_widget.dart';

class DepatureInputWidget extends StatefulWidget {
  const DepatureInputWidget({Key? key}) : super(key: key);

  @override
  _DepatureInputWidgetState createState() => _DepatureInputWidgetState();
}

class _DepatureInputWidgetState extends State<DepatureInputWidget> {
  DateTime selectedDate = DateTime.now();
  String _destinationDate = DateTime.now().toString();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  Widget buildSheet() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Passenger Information',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Adults +12 yrs'),
                CounterInputWidget(
                  minimum: 1,
                  initial: 1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Childrens under 12 yrs'),
                CounterInputWidget(),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.07,
                ),
              ),
              onPressed: () {},
              child: Text('Apply'),
            ),
            SizedBox(height: 20),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Depature Date'),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                WaterCounterWidget(
                  title: _destinationDate,
                  tapFunction: () => _selectDate(context),
                ),
                SizedBox(height: 30),
                WaterCounterWidget(
                  title: '1 Traveller',
                  tapFunction: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                  ),
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
          ),
        ],
      ),
    );
  }
}
