import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarTile extends StatelessWidget {
  AppBarTile({this.text, this.desc, this.icon, this.press});

  final String text;
  final String desc;
  final IconData icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: kLightBlueColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kIconsColor,
              size: 30.0,
            ),
            SizedBox(height: 17.0),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lorem ipsum, loremIpsum loremIpsum',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      onTap: press,
    );
  }
}
