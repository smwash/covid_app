import 'package:covid_app/constants.dart';
import 'package:covid_app/providers/country_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'stats_card.dart';

class StatsContainer extends StatefulWidget {
  @override
  _StatsContainerState createState() => _StatsContainerState();
}

class _StatsContainerState extends State<StatsContainer> {
  CountryData data = CountryData();
  List<PieChartSectionData> _sections = List<PieChartSectionData>();

  fetchData() async {
    await data.fetchCountryData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return data.countryData == null
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: kIconsColor,
            ),
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: StatsCard(
                      text: 'Recovered',
                      color: Colors.green.withOpacity(0.9),
                      numbers: data.countryData['recovered'].toString(),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: StatsCard(
                      text: 'Deaths',
                      color: kDeathColor,
                      numbers: data.countryData['deaths'].toString(),
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
                      numbers: data.countryData['cases'].toString(),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: StatsCard(
                      text: 'Active Cases',
                      color: kActiveColor,
                      numbers: data.countryData['active'].toString(),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: StatsCard(
                      text: 'Critical Cases',
                      color: kCriticalColor,
                      numbers: data.countryData['critical'].toString(),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
