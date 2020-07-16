import 'package:flutter/material.dart';

class BestPracticesCard extends StatelessWidget {
  const BestPracticesCard({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            image,
            height: size.height * 0.1,
            width: size.width * 0.22,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
