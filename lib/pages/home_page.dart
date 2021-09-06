import 'package:flutter/material.dart';
import 'package:khanepani/widgets/bottom_sheet_widget.dart';
import 'package:khanepani/widgets/top_card_widget.dart';
import 'package:khanepani/widgets/water_counter_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khanepani Payment'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopCardWidget(),
                SizedBox(height: 30),
                Text(
                  'Khanepani Counter',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                WaterCounterWidget(),
                SizedBox(height: 30),
                Text(
                  'Customer ID',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusColor: Colors.grey.shade200,
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                  cursorHeight: 25,
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
                  child: Text('Proceed'),
                ),
              ],
            ),
          ),
          BottomSheetWidget(),
        ],
      ),
    );
  }
}
