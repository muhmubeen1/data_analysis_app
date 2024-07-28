import "package:flutter/material.dart";

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);
  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Text("Countries List"),
          ],
        )),
      ),
    );
  }
}
