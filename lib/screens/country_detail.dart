import 'package:covid_app/widgets/stats_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CountryDetail extends StatelessWidget {
  final dynamic data;

  const CountryDetail({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.34,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                data['country'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: Image.network(
                data['countryInfo']['flag'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: StatsCard(
                              text: 'Recovered',
                              color: Colors.green.withOpacity(0.9),
                              numbers: data['recovered'].toString(),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: StatsCard(
                              text: 'Deaths',
                              color: kDeathColor,
                              numbers: data['deaths'].toString(),
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
                              numbers: data['cases'].toString(),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: StatsCard(
                              text: 'Active Cases',
                              color: kActiveColor,
                              numbers: data['active'].toString(),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: StatsCard(
                              text: 'Critical Cases',
                              color: kCriticalColor,
                              numbers: data['critical'].toString(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, right: size.width * 0.25),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 10),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Total Population:  ',
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          data['population'].toString(),
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
