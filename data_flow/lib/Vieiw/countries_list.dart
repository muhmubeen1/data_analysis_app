import 'package:data_flow/Services/world_statsServices.dart';
import 'package:data_flow/Vieiw/country_stats.dart';
import 'package:data_flow/Vieiw/world_states.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
                    onChanged: (value) {
                      setState(() {});
                    },
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
                            return ListView.builder(
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade700,
                                    highlightColor: Colors.grey.shade100,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Container(
                                            height: 10,
                                            width: 89,
                                            color: Colors.white,
                                          ),
                                          subtitle: Container(
                                            height: 10,
                                            width: 89,
                                            color: Colors.white,
                                          ),
                                          leading: Container(
                                            height: 50,
                                            width: 50,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  String name =
                                      snapshot.data![index]["country"];
                                  if (textEditingController.text.isEmpty) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            (MaterialPageRoute(
                                                builder: (context) =>
                                                    CountryStats(
                                                      image: snapshot
                                                                  .data![index]
                                                              ['countryInfo']
                                                          ['flag'],
                                                      name:
                                                          snapshot.data![index]
                                                              ['country'],
                                                      cases:
                                                          snapshot.data![index]
                                                              ['cases'],
                                                      todayCases:
                                                          snapshot.data![index]
                                                              ['todayCases'],
                                                      deaths:
                                                          snapshot.data![index]
                                                              ['deaths'],
                                                      recovered:
                                                          snapshot.data![index]
                                                              ['recovered'],
                                                    ))));
                                      },
                                      child: Column(
                                        children: [
                                          ListTile(
                                              title: Text(
                                                snapshot.data![index]
                                                    ["country"],
                                                style: TextStyle(
                                                    color: Colors.white38),
                                              ),
                                              subtitle: Text(
                                                snapshot.data![index]["cases"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white38),
                                              ),
                                              leading: Image(
                                                  height: 50,
                                                  width: 50,
                                                  image: NetworkImage(
                                                      snapshot.data![index]
                                                              ["countryInfo"]
                                                          ["flag"]))),
                                        ],
                                      ),
                                    );
                                  } else if (name.toLowerCase().contains(
                                      textEditingController.text
                                          .toLowerCase())) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            (MaterialPageRoute(
                                                builder: (context) =>
                                                    CountryStats(
                                                      image: snapshot
                                                                  .data![index]
                                                              ['countryInfo']
                                                          ['flag'],
                                                      name:
                                                          snapshot.data![index]
                                                              ['country'],
                                                      cases:
                                                          snapshot.data![index]
                                                              ['cases'],
                                                      todayCases:
                                                          snapshot.data![index]
                                                              ['todayCases'],
                                                      deaths:
                                                          snapshot.data![index]
                                                              ['deaths'],
                                                      recovered:
                                                          snapshot.data![index]
                                                              ['recovered'],
                                                    ))));
                                      },
                                      child: Column(
                                        children: [
                                          ListTile(
                                              title: Text(
                                                snapshot.data![index]
                                                    ["country"],
                                                style: TextStyle(
                                                    color: Colors.white38),
                                              ),
                                              subtitle: Text(
                                                snapshot.data![index]["cases"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white38),
                                              ),
                                              leading: Image(
                                                  height: 50,
                                                  width: 50,
                                                  image: NetworkImage(
                                                      snapshot.data![index]
                                                              ["countryInfo"]
                                                          ["flag"]))),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                });
                          }
                        })),
              ],
            ),
          ),
        ));
  }
}
