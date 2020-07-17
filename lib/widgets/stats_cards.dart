import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid_app/constants.dart';
import 'package:covid_app/providers/country_data.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'stats_card.dart';

class StatsContainer extends StatefulWidget {
  @override
  _StatsContainerState createState() => _StatsContainerState();
}

class _StatsContainerState extends State<StatsContainer> {
  CountryData data = CountryData();
  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
    final deskTopData = [
      Sales(
        year: '2014',
        sales: random.nextInt(100),
      ),
      Sales(
        year: '2015',
        sales: random.nextInt(100),
      ),
      Sales(
        year: '2016',
        sales: random.nextInt(100),
      ),
      Sales(
        year: '2017',
        sales: random.nextInt(100),
      ),
      Sales(
        year: '2018',
        sales: random.nextInt(100),
      ),
      Sales(
        year: '2019',
        sales: random.nextInt(100),
      ),
      Sales(
        year: '2020',
        sales: random.nextInt(100),
      ),
    ];
    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: deskTopData,
      )
    ];
  }

  barChart() {
    charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  fetchData() async {
    await data.fetchCountryData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    seriesList = _createRandomData();
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: barChart(),
                ),
              ),
            ],
          );
  }
}

class Sales {
  final String year;
  final int sales;

  Sales({this.year, this.sales});
}
