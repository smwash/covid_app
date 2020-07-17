import 'package:covid_app/constants.dart';
import 'package:covid_app/providers/country_data.dart';
import 'package:covid_app/screens/country_detail.dart';
import 'package:covid_app/widgets/appbar_grid.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  CountryData data = CountryData();

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  fetchCountries() async {
    await data.fetchallCountriesData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: data.countries == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: size.height * 0.35,
                  pinned: true,
                  floating: true,
                  centerTitle: true,
                  backgroundColor: kBlueColor,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Out',
                          style: TextStyle(
                              fontSize: 20.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: '2',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        ),
                        TextSpan(
                          text: '5',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '4',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/worldImage.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var contData = data.countries[index];
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 10),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Hero(
                            tag: contData['countryInfo']['flag'],
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                contData['countryInfo']['flag'],
                              ),
                            ),
                          ),
                          title: Text(
                            data.countries[index]['country'],
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0),
                          ),
                          subtitle: Row(
                            children: [
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Total Cases: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.red[400],
                                            fontWeight: FontWeight.w600),
                                      ),
                                      TextSpan(
                                        text:
                                            '${data.countries[index]['cases']}',
                                        style: TextStyle(
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '  Recovered: ',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.green[500],
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text:
                                          '${data.countries[index]['recovered']}',
                                      style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryDetail(
                                  data: contData,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    childCount: data.countries.length,
                  ),
                ),
              ],
            ),
    );
  }
}
