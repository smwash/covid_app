import 'package:covid_app/screens/bottomNav.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'providers/country_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Tracker',
      theme: ThemeData(
        fontFamily: 'NunitoSans',
      ),
      home: BottomNavPage(),
    );
  }
}
