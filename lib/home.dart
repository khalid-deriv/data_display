import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List userData = [];
  // List userData = [
  //   {
  //     "id": 1,
  //     "first_name": "Billie",
  //     "last_name": "Redgewell",
  //     "username": "bredgewell0",
  //     "last_seen_time": "9:30 AM",
  //     "avatar":
  //         "https://robohash.org/doloribusiuredolor.png?size=50x50&set=set1",
  //     "status": "policy"
  //   },
  //   {
  //     "id": 2,
  //     "first_name": "Jacobo",
  //     "last_name": "Sporton",
  //     "username": "jsporton1",
  //     "last_seen_time": "3:17 AM",
  //     "avatar":
  //         "https://robohash.org/suscipitplaceatut.png?size=50x50&set=set1",
  //     "status": "Implemented"
  //   },
  //   {
  //     "id": 3,
  //     "first_name": "Shae",
  //     "last_name": "Muldoon",
  //     "username": "smuldoon2",
  //     "last_seen_time": "2:17 PM",
  //     "avatar":
  //         "https://robohash.org/laudantiumsitvoluptatem.png?size=50x50&set=set1",
  //     "status": "Re-engineered",
  //     "messages": 2
  //   },
  //   {
  //     "id": 4,
  //     "first_name": "Weidar",
  //     "last_name": "Lowen",
  //     "username": "wlowen3",
  //     "last_seen_time": "2:13 AM",
  //     "avatar": "https://robohash.org/utquiin.png?size=50x50&set=set1",
  //     "status": "Inverse"
  //   },
  //   {
  //     "id": 5,
  //     "first_name": "Ado",
  //     "last_name": "Hallbord",
  //     "username": "ahallbord4",
  //     "last_seen_time": "5:17 AM",
  //     "avatar":
  //         "https://robohash.org/sitexplicabovoluptas.png?size=50x50&set=set1",
  //     "status": "adapter"
  //   },
  // ];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('mockdata.json');
    final data = await json.decode(response);
    setState(() {
      userData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            width: double.infinity,
            child: Center(
              child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: userData.map((user) {
                    return Column(children: [
                      ItemCard(
                          user: User(
                              id: user['id'],
                              first_name: user['first_name'],
                              last_name: user['last_name'],
                              last_seen_time: user['last_seen_time'],
                              username: user['username'],
                              avatar: user['avatar'],
                              status: user['status'],
                              messages: user['messages'])),
                      const Divider(),
                    ]);
                  }).toList()),
            )));
  }
}

// child: Text("Welcome home!",
//                 style: TextStyle(fontSize: 30, color: Colors.teal))));
