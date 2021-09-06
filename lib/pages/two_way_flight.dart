import 'package:flutter/material.dart';

import 'package:khanepani/widgets/counter_input_widget.dart';
import 'package:khanepani/widgets/flight_input_widget.dart';
import 'package:khanepani/widgets/water_counter_widget.dart';

class TwoWayFlight extends StatefulWidget {
  const TwoWayFlight({Key? key}) : super(key: key);

  @override
  _TwoWayFlightState createState() => _TwoWayFlightState();
}

class _TwoWayFlightState extends State<TwoWayFlight> {
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
    return Column(
      children: [
        SizedBox(height: 30),
        FlightInputWidget(),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Depature Date'),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: WaterCounterWidget(
                          title: 'Tue, 7 Sept',
                          tapFunction: () => _selectDate(context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Return Date'),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: WaterCounterWidget(
                          title: 'Wed, 8 Sept',
                          tapFunction: () => _selectDate(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
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
    );
  }
}
