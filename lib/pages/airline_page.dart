import 'package:flutter/material.dart';
import 'package:khanepani/widgets/flight_card_widget.dart';

class Airline extends StatefulWidget {
  const Airline({Key? key}) : super(key: key);

  @override
  _AirlineState createState() => _AirlineState();
}

class _AirlineState extends State<Airline> {
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
        child: Column(
          children: [
            FlightCardWidget(),
          ],
        ),
      ),
    );
  }
}
