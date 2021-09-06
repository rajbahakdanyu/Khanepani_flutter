import 'package:flutter/material.dart';
import 'package:khanepani/widgets/depature_widget.dart';

class DepatureInputWidget extends StatefulWidget {
  const DepatureInputWidget({Key? key}) : super(key: key);

  @override
  _DepatureInputWidgetState createState() => _DepatureInputWidgetState();
}

class _DepatureInputWidgetState extends State<DepatureInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Depature Date'),
          SizedBox(height: 10),
          DepatureWidget(),
        ],
      ),
    );
  }
}
