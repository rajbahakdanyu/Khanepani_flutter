import 'package:flutter/material.dart';

class TopCardWidget extends StatelessWidget {
  const TopCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.account_balance_wallet_outlined,
                size: 40,
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('NPR'),
                      SizedBox(width: 5),
                      Text(
                        '123.45',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text('Balance'),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.refresh_rounded,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 8.0,
    );
  }
}
