import 'package:covid_app/providers/country_data.dart';
import 'package:covid_app/screens/global_screen.dart';
import 'package:covid_app/screens/mycountryTab.dart';
import 'package:covid_app/widgets/appbar_title.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  CountryData _quotes = CountryData();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
    _tabController = TabController(length: 2, vsync: this);
  }

  fetchQuotes() async {
    await _quotes.fetchQuotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        elevation: 0.0,
        centerTitle: true,
        title: AppBarTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: kLightBlueColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quote of the day :',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Self-complacency is fatal to progress.',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Statistics',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        fontSize: 23.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: size.height * 0.06,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 17.5, fontWeight: FontWeight.w600),
                      indicator: BoxDecoration(
                        color: kIconsColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      tabs: [
                        Text(
                          'My Country',
                        ),
                        Text(
                          'Global',
                        ),
                      ],
                      onTap: (index) {},
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MyCountryTab(),
                        GlobalScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
