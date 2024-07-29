import 'package:data_flow/Vieiw/world_states.dart';
import 'package:flutter/material.dart';

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
            backgroundColor: const Color.fromARGB(255, 90, 90, 90),
            appBar: AppBar(
                backgroundColor: Color.fromRGBO(90, 90, 90, 1),
                leading: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorldStates()));
                    },
                    child: Container(
                      child: Icon(Icons.arrow_back),
                    )))));
  }
}
