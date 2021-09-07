import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khanepani/providers/passenger_provider.dart';

import 'package:khanepani/widgets/counter_input_widget.dart';
import 'package:khanepani/widgets/water_counter_widget.dart';
import 'package:provider/provider.dart';

class DepatureInputWidget extends StatefulWidget {
  const DepatureInputWidget({Key? key}) : super(key: key);

  @override
  _DepatureInputWidgetState createState() => _DepatureInputWidgetState();
}

class _DepatureInputWidgetState extends State<DepatureInputWidget> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PassengerProvider>(context, listen: false).initPassengers();
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
                  pType: 'Adult',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Childrens under 12 yrs'),
                CounterInputWidget(
                  pType: 'Child',
                ),
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
                  title: DateFormat.MMMEd().format(selectedDate),
                  tapFunction: () => _selectDate(context),
                ),
                SizedBox(height: 30),
                Consumer<PassengerProvider>(
                    builder: (context, passenger, child) {
                  return WaterCounterWidget(
                    title: '${passenger.totalPassengers} Traveller',
                    tapFunction: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => buildSheet(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                    ),
                  );
                }),
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
