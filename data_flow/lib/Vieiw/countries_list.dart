import 'package:data_flow/Services/world_statsServices.dart';
import 'package:data_flow/Vieiw/world_states.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);
  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController textEditingController = TextEditingController();
  StatesServices statesServices = StatesServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 90, 90, 90),
          appBar: AppBar(
              backgroundColor: Color.fromRGBO(90, 90, 90, 1),
              leading: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WorldStates()));
                  },
                  child: Container(
                    child: Icon(Icons.arrow_back),
                  ))),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: "Search by Country name",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Expanded(
                    child: FutureBuilder(
                        future: statesServices.getCountriesList(),
                        builder:
                            (context, AsyncSnapshot<List<dynamic>> snapshot) {
                          if (!snapshot.hasData) {
                            return Text("LOADING");
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                          leading: Image(
                                              image: NetworkImage(snapshot
                                                      .data![index]
                                                  ["countryInfo"]["flag"]))),
                                    ],
                                  );
                                });
                          }
                        })),
              ],
            ),
          ),
        ));
  }
}
