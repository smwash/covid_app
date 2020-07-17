import 'package:covid_app/providers/country_data.dart';
import 'package:covid_app/widgets/stats_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'allCountries.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  CountryData _data = CountryData();

  @override
  void initState() {
    super.initState();
    fetchWorldData();
  }

  fetchWorldData() async {
    await _data.fetchWorldData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _data.worldData == null
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: kIconsColor,
            ),
          )
        : Container(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: StatsCard(
                            text: 'Recovered',
                            color: Colors.green.withOpacity(0.9),
                            numbers: _data.worldData['recovered'].toString(),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: StatsCard(
                            text: 'Deaths',
                            color: kDeathColor,
                            numbers: _data.worldData['deaths'].toString(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: StatsCard(
                            text: 'Total Cases',
                            color: kAffectedColor,
                            numbers: _data.worldData['cases'].toString(),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: StatsCard(
                            text: 'Active Cases',
                            color: kActiveColor,
                            numbers: _data.worldData['active'].toString(),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: StatsCard(
                            text: 'Critical Cases',
                            color: kCriticalColor,
                            numbers: _data.worldData['critical'].toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Affected Countries',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: kIconsColor, width: 2),
                          ),
                          child: Text(
                            'View All',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.5,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllCountries(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
