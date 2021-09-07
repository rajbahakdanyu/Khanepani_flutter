import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  TextEditingController _searchController = new TextEditingController();
  List<String> _foundList = [];

  List<String> _counterList = [
    'Achham',
    'Arghakhanchi',
    'Baglung',
    'Baitadi',
    'Bajhang',
    'Bajura',
    'Banke',
    'Bara',
    'Bardiya',
    'Bhaktapur',
    'Bhojpur',
    'Chitwan',
    'Dadeldhura',
    'Dailekh',
    'Dang',
    'Darchula',
    'Dhading',
    'Dhankuta',
    'Dhanusa',
    'Dolakha',
    'Dolpa',
    'Doti',
    'Gorkha',
    'Humla',
    'Ilam',
    'Jajarkot',
    'Jhapa',
    'Jumla',
    'Kailali',
    'Kalikot',
    'Kanchanpur',
    'Kapilvastu',
    'Kaski',
    'Kathmandu',
    'Kavrepalanchok',
    'Khotang',
    'Lalitpur',
    'Lamjung',
    'Mahottari',
    'Makwanpur',
    'Manang',
    'Morang',
    'Mugu',
    'Mustang',
    'Myagdi',
    'Nawalparasi',
    'Nuwakot',
    'Okhaldhunga',
    'Palpa',
    'Panchthar',
    'Parbat',
    'Parsa',
    'Pyuthan',
    'Ramechhap',
    'Rasuwa',
    'Rautahat',
    'Rolpa',
    'Rukum',
    'Rupandehi',
    'Salyan',
    'Sankhuwasabha',
    'Saptari',
    'Sarlahi',
    'Sindhuli',
    'Sindhupalchok',
    'Siraha',
    'Solukhumbu',
    'Sunsari',
    'Surkhet',
    'Syangja',
    'Tanahu',
    'Terhathum',
    'Udayapur',
  ];

  @override
  initState() {
    super.initState();

    _foundList = _counterList;
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];

    if (enteredKeyword.isEmpty) {
      results = _counterList;
    } else {
      results = _counterList
          .where((place) =>
              place.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundList = results;
    });
  }

  Widget counterBuilder() {
    return ListView.builder(
      itemCount: _foundList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_foundList[index]),
          onTap: () {},
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
          ? counterBuilder()
          : Center(
              child: Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
