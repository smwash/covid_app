import 'package:covid_app/providers/country_data.dart';

import 'package:covid_app/widgets/stats_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TodayReport extends StatefulWidget {
  @override
  _TodayReportState createState() => _TodayReportState();
}

class _TodayReportState extends State<TodayReport> {
  CountryData data = CountryData();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await data.fetchCountryData();
    setState(() {});
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
                      numbers: data.countryData['todayRecovered'].toString(),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: StatsCard(
                      text: 'Deaths',
                      color: kDeathColor,
                      numbers: data.countryData['todayDeaths'].toString(),
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
                      numbers: data.countryData['todayCases'].toString(),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ],
          );
  }
}
