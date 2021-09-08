import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khanepani/providers/passenger_provider.dart';

import 'package:khanepani/widgets/counter_input_widget.dart';
import 'package:khanepani/widgets/flight_input_widget.dart';
import 'package:khanepani/widgets/water_counter_widget.dart';
import 'package:provider/provider.dart';

class TwoWayFlight extends StatefulWidget {
  const TwoWayFlight({Key? key}) : super(key: key);

  @override
  _TwoWayFlightState createState() => _TwoWayFlightState();
}

class _TwoWayFlightState extends State<TwoWayFlight> {
  DateTime depatureDate = DateTime.now();
  DateTime returnDate = DateTime.now();

  _selectDepature(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: depatureDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (selected != null && selected != depatureDate)
      setState(() {
        depatureDate = selected;
      });
  }

  _selectReturn(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: depatureDate,
      firstDate: depatureDate,
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (selected != null && selected != returnDate)
      setState(() {
        returnDate = selected;
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
                          title: DateFormat.MMMEd().format(depatureDate),
                          tapFunction: () => _selectDepature(context),
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
                          title: DateFormat.MMMEd().format(returnDate),
                          tapFunction: () => _selectReturn(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                },
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
