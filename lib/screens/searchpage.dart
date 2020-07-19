import 'package:flutter/material.dart';

import 'country_detail.dart';

class Search extends SearchDelegate {
  final List countries;
  Search({@required this.countries});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countries
        : countries
            .where((country) =>
                country['country'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                tag: suggestionList[index]['countryInfo']['flag'],
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    suggestionList[index]['countryInfo']['flag'],
                  ),
                ),
              ),
              title: Text(
                suggestionList[index]['country'],
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
                            text: '${suggestionList[index]['cases']}',
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
                          text: '${suggestionList[index]['recovered']}',
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
                      data: suggestionList[index],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
