import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountryStats extends StatefulWidget {
  String name;
  int cases;
  int todayCases;
  int deaths;
  int recovered;

  CountryStats(
      {required this.name,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.recovered});
  @override
  State<CountryStats> createState() => _CountryStatsState();
}

class _CountryStatsState extends State<CountryStats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 90, 90, 90),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 90, 90, 90),
          title: Text(
            widget.name.toString(),
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: true,
          centerTitle: true,
        ),
      ),
    );
  }
}
