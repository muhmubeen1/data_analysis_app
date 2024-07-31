import 'package:data_flow/Vieiw/countries_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountryStats extends StatefulWidget {
  String name, image;
  int cases;
  int todayCases;
  int deaths;
  int recovered;

  CountryStats(
      {required this.image,
      required this.name,
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
        body: SafeArea(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Image(
                  image: NetworkImage(widget.image.toString()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey.shade800,
                child: Column(
                  children: [
                    ReuseableRow(name: "Cases", value: widget.cases),
                    ReuseableRow(name: "Today Cases", value: widget.todayCases),
                    ReuseableRow(name: "Deaths", value: widget.deaths),
                    ReuseableRow(name: "Recovered", value: widget.recovered),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    (MaterialPageRoute(builder: (context) => CountriesList())));
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal.shade800,
                ),
                child: Center(
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class ReuseableRow extends StatefulWidget {
  String name;
  int value;
  ReuseableRow({Key? key, required this.name, required this.value})
      : super(key: key);
  @override
  State<ReuseableRow> createState() => _ReuseableRowState();
}

class _ReuseableRowState extends State<ReuseableRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: TextStyle(color: Colors.white54),
              ),
              Text(widget.value.toString(),
                  style: TextStyle(color: Colors.white54)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
