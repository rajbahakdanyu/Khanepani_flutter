import 'package:flutter/material.dart';

class FlightCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: TabBar(
          labelPadding: EdgeInsets.all(5),
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(
                Icons.arrow_right_alt,
                color: Colors.green,
                size: 35,
              ),
              text: 'One Way',
            ),
            Tab(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.green,
                size: 35,
              ),
              text: 'Two Way',
            ),
            Tab(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.green,
                size: 35,
              ),
              text: 'Mountain Flight',
            ),
          ],
        ),
      ),
    );
  }
}
