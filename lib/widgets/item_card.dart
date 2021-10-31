import 'package:flutter/material.dart';

class User {
  User(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.username,
      required this.last_seen_time,
      this.avatar =
          "https://w7.pngwing.com/pngs/419/473/png-transparent-computer-icons-user-profile-login-user-heroes-sphere-black-thumbnail.png",
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
                  flex: 3, child: Center(child: Text(widget.user.username))),
              Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.user.first_name + " " + widget.user.last_name),
                      Text(widget.user.status)
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.user.last_seen_time),
                      Text(widget.user.messages.toString())
                    ],
                  ))
            ]));
  }
}
