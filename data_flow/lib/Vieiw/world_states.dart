import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);
  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 90, 90, 90),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            PieChart(
              dataMap: {
                "Total": 300,
                "Recovered": 10,
                "Death": 100,
              },
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.left,
              ),
              animationDuration: Duration(microseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.06),
              child: Card(
                color: const Color.fromARGB(53, 105, 104, 104),
                child: Column(
                  children: [
                    ReuseableRow(title: "Total", value: "400"),
                    ReuseableRow(title: "Total", value: "400"),
                    ReuseableRow(title: "Total", value: "400"),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text("Track Countries"),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class ReuseableRow extends StatefulWidget {
  String title, value;
  ReuseableRow({Key? key, required this.title, required this.value})
      : super(key: key);
  @override
  State<ReuseableRow> createState() => _ReuseableRowState();
}

class _ReuseableRowState extends State<ReuseableRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.title}  ",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "${widget.value} ",
                style: TextStyle(color: Colors.white),
              ),
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
