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
              child: userData.isNotEmpty
                  ? ListView(
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
                      }).toList())
                  : const Text("Loading..."),
            )));
  }
}
