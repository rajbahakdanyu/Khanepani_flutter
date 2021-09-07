import 'package:flutter/material.dart';
import 'package:khanepani/middlewares/validator_mixin.dart';

import 'package:khanepani/widgets/bottom_sheet_widget.dart';
import 'package:khanepani/widgets/top_card_widget.dart';
import 'package:khanepani/widgets/water_counter_widget.dart';

class Khanepani extends StatefulWidget {
  const Khanepani({Key? key}) : super(key: key);

  @override
  _KhanepaniState createState() => _KhanepaniState();
}

class _KhanepaniState extends State<Khanepani> {
  TextEditingController _customerId = new TextEditingController();

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
                WaterCounterWidget(
                  title: 'Select',
                  tapFunction: () =>
                      Navigator.of(context).pushNamed('/counterPage'),
                ),
                SizedBox(height: 30),
                Text(
                  'Customer ID',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _customerId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusColor: Colors.grey.shade200,
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                  cursorHeight: 25,
                  onEditingComplete: () {
                    var result =
                        ValidationMixin().validateUserName(_customerId.text);

                    if (result.runtimeType == String) {
                      print(result);
                    } else {
                      print('Valid Customer Id');
                    }
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
