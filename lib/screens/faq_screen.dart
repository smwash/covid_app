import 'package:covid_app/models/faq_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class FaqsScreen extends StatefulWidget {
  @override
  _FaqsScreenState createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final String _mythBusterUrl =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters';
  final String _donateUrl = 'https://covid19responsefund.org/';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        centerTitle: true,
        title: Text(
          'FAQs',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.25),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [kBoxShadow],
            ),
            child: Column(
              children: [
                Text(
                  'WHO Links',
                  style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w900),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [kBoxShadow],
                  ),
                  child: ListTile(
                      leading: Icon(Icons.security, color: Colors.red),
                      title: Text(
                        'Myth Busters',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        launch(_mythBusterUrl);
                      }),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [kBoxShadow],
                  ),
                  child: ListTile(
                      leading: Icon(
                        Icons.attach_money,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Donate',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        launch(_donateUrl);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [kBoxShadow],
                  ),
                  child: ExpansionTile(
                    title: Text(
                      FaqDetails.faqs[index]['question'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(
                      Icons.local_hospital,
                      color: kBlueColor,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          FaqDetails.faqs[index]['answer'],
                          style: TextStyle(
                              fontSize: 14.5, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: FaqDetails.faqs.length,
            ),
          ),
        ],
      ),
    );
  }
}
