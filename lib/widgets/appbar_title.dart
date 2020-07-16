import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Out',
            style: TextStyle(
                fontSize: 19.0, letterSpacing: 1, fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '2',
            style: TextStyle(
                fontSize: 23.0, fontWeight: FontWeight.w700, color: Colors.red),
          ),
          TextSpan(
            text: '5',
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '4',
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w700,
                color: Colors.green),
          ),
        ],
      ),
    );
  }
}
