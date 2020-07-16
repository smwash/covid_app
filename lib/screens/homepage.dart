import 'package:covid_app/widgets/appbar_title.dart';
import 'package:covid_app/widgets/emergency_btns.dart';
import 'package:covid_app/widgets/practices_card.dart';

import '../constants.dart';
import '../widgets/appbar_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        elevation: 0.0,
        centerTitle: true,
        title: AppBarTitle(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(
              backgroundColor: kIconsColor,
              child: Text(
                'PK',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: kBlueColor,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 2 / 2,
              ),
              children: [
                AppBarTile(
                  text: 'Symptoms',
                  icon: Icons.sentiment_dissatisfied,
                  press: () {},
                ),
                AppBarTile(
                  text: 'Prevention',
                  icon: Icons.local_hospital,
                  press: () {},
                ),
                AppBarTile(
                  text: 'Reports',
                  icon: Icons.pie_chart,
                  press: () {},
                ),
                AppBarTile(
                  text: 'Countries',
                  icon: Icons.map,
                  press: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  kLightBlueColor.withOpacity(0.95),
                  kLightBlueColor.withOpacity(0.94),
                  kLightBlueColor.withOpacity(0.93),
                  kLightBlueColor,
                  kBlueColor,
                ],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Image.asset(
                  'images/doc.PNG',
                  height: size.height * 0.15,
                  width: size.width * 0.2,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Are You Feeling Sick',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      'Lorem ipsum, loremIpsum \nloremIpsum',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EmergencyBtn(
                          text: 'Call',
                          icon: Icons.phone,
                          color: kCriticalColor,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        EmergencyBtn(
                          text: 'SMS',
                          icon: Icons.chat_bubble,
                          color: kDeathColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Best Measures',
              style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BestPracticesCard(
                      text: 'Wear A Facemask', image: 'images/facemask.jpg'),
                ),
                Expanded(
                  child: BestPracticesCard(
                      text: 'Wash Your Hands Often',
                      image: 'images/handwash.jpg'),
                ),
                Expanded(
                  child: BestPracticesCard(
                      text: 'Avoid Close Contact',
                      image: 'images/socialDistancing.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
