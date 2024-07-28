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
        backgroundColor: Colors.black,
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
          ],
        )),
      ),
    );
  }
}
