import 'dart:convert';

import 'package:http/http.dart' as http;

class CountryData {
  Map countryData;
  Map worldData;
  List countries;
  dynamic quotes;

  Future<dynamic> fetchCountryData() async {
    String url = 'https://disease.sh/v3/covid-19/countries/KE';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    return countryData = data;
  }

  Future<dynamic> fetchWorldData() async {
    String url = 'https://corona.lmao.ninja/v3/covid-19/all';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    return worldData = data;
  }

  Future<dynamic> fetchallCountriesData() async {
    String url = 'https://corona.lmao.ninja/v3/covid-19/countries';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    return countries = data;
  }

  Future<dynamic> fetchQuotes() async {
    String url = 'https://type.fit/api/quotes';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return quotes = data;
    } else {
      return null;
    }
  }
}
