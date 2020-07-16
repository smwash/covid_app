import 'package:covid_app/constants.dart';
import 'package:covid_app/providers/country_data.dart';
import 'package:covid_app/widgets/stats_cards.dart';
import 'package:flutter/material.dart';

import 'today_report.dart';

class MyCountryTab extends StatefulWidget {
  @override
  _MyCountryTabState createState() => _MyCountryTabState();
}

class _MyCountryTabState extends State<MyCountryTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  CountryData data = CountryData();

  @override
  void initState() {
    super.initState();
    fetchData();
    _tabController = TabController(length: 3, vsync: this);
  }

  fetchData() async {
    await data.fetchCountryData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: TabBar(
              unselectedLabelColor: Colors.white70,
              controller: _tabController,
              labelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              indicatorColor: Colors.transparent,
              tabs: [
                Text(
                  'Total',
                ),
                Text(
                  'Today',
                ),
                Text(
                  'Yesterday',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                StatsContainer(),
                TodayReport(),
                Container(
                  height: 20.0,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
