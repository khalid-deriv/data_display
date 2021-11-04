import 'package:flutter/material.dart';

import 'badge.dart';

class User {
  User(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.username,
      required this.last_seen_time,
      this.avatar = "https://i.imgur.com/7mdRMYO.png",
      this.status = "...",
      this.messages});
  final int id;
  final String first_name;
  final String last_name;
  final String username;
  final String last_seen_time;
  final String avatar;
  final String status;
  final int? messages;
}

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 3,
                  child: Center(
                      child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.avatar),
                  ))),
              Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.user.first_name + " " + widget.user.last_name),
                      Text(
                        widget.user.username,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('Status: ${widget.user.status}')
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.user.last_seen_time),
                      widget.user.messages != null
                          ? Badge(value: widget.user.messages.toString())
                          : Text("")
                    ],
                  ))
            ]));
  }
}
