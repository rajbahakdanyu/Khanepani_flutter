import 'package:flutter/material.dart';

import 'package:khanepani/pages/mountain_flight.dart';
import 'package:khanepani/pages/one_way_flight.dart';
import 'package:khanepani/pages/two_way_flight.dart';
import 'package:khanepani/providers/passenger_provider.dart';
import 'package:khanepani/widgets/flight_card_widget.dart';
import 'package:provider/provider.dart';

class Airline extends StatefulWidget {
  const Airline({Key? key}) : super(key: key);

  @override
  _AirlineState createState() => _AirlineState();
}

class _AirlineState extends State<Airline> {
  @override
  void initState() {
    super.initState();
    Provider.of<PassengerProvider>(context, listen: false).initPassengers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Flight'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(primary: Colors.green),
              onPressed: () {},
              child: Text(
                'Reschedule',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlightCardWidget(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.75,
                child: TabBarView(
                  children: [
                    OneWayFlight(),
                    TwoWayFlight(),
                    MountainFlight(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
