import 'package:flutter/material.dart';

class EmergencyBtn extends StatelessWidget {
  const EmergencyBtn({
    Key key,
    this.icon,
    this.text,
    this.color,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      color: color,
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            letterSpacing: 1.1,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
