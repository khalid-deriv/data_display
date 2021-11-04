import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({Key? key, required this.value, this.color}) : super(key: key);
  final String value;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color ?? Colors.red,
        ),
        constraints: BoxConstraints(
          minWidth: 12,
          minHeight: 12,
          maxHeight: 25,
          maxWidth: 25,
        ),
        child: Center(
            child: Text(
          value,
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        )));
  }
}
