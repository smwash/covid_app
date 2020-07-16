import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key key,
    this.text,
    this.numbers,
    this.color,
  }) : super(key: key);
  final String text;
  final String numbers;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            ),
          ),
          Text(
            numbers,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 22.0),
          ),
        ],
      ),
    );
  }
}
