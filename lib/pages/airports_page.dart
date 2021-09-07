import 'package:flutter/material.dart';

class Airport extends StatefulWidget {
  const Airport({Key? key}) : super(key: key);

  @override
  _AirportState createState() => _AirportState();
}

class _AirportState extends State<Airport> {
  TextEditingController _searchController = new TextEditingController();
  List<String> _foundList = [];

  List<String> _airportList = [
    'Jumla (JUM)',
    'Dhangadhi (DHI)',
    'Dolpa (DOP)',
    'Kathmandu (KTM)',
    'Mountain (MTN)',
    'Simikot (IMK)',
    'Biratnagar (BIR)',
    'Bajura (BJR)',
    'Rajbiraj (RJB)',
    'Bhairahwa (BWA)',
    'Bharatpur (BHR)',
    'Jomsom (JMO)',
    'Phaplu (PPL)',
    'Bhadrapur (BDP)',
    'Janakpur (JKR)',
    'Simara (SIF)',
    'Surkhet (SKH)',
    'Tumlingtar (TMI)',
    'Pokhara (PKR)',
    'Ramechhap (RCH)',
    'Nepalgunj (KEP)',
    'Lukla (LUA)',
    'Talcha (TAL)',
  ];

  @override
  initState() {
    super.initState();

    _foundList = _airportList;
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];

    if (enteredKeyword.isEmpty) {
      results = _airportList;
    } else {
      results = _airportList
          .where((place) =>
              place.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundList = results;
    });
  }

  Widget airportBuilder() {
    return ListView.builder(
      itemCount: _foundList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_foundList[index]),
          onTap: () => Navigator.pop(context, _foundList[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
          onChanged: (v) => _runFilter(v),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _searchController.clear();
              _runFilter('');
            },
            icon: Icon(Icons.close_outlined),
          )
        ],
      ),
      body: _foundList.length > 0
          ? airportBuilder()
          : Center(
              child: Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
