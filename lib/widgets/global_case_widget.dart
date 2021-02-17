import 'package:covid_19_worldwide/controllers/bindings/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class GlobalCaseWidget extends StatelessWidget {
  //
  final GlobalController _globalController = Get.find<GlobalController>();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildStatisticData()),
          Expanded(child: _buildChart()),
        ],
      ),
    );
    //
  }

  //
  Widget _buildStatisticData() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 8)),
          _itemConfirmed(),
          Padding(padding: EdgeInsets.only(top: 8)),
          _itemRecovered(),
          Padding(padding: EdgeInsets.only(top: 8)),
          _itemDeaths(),
          Padding(padding: EdgeInsets.only(top: 8)),
        ],
      ),
    );
  }

  //
  Widget _buildChart() {
    return Container(
      child: Obx(
        () => PieChart(
          chartType: ChartType.ring,
          showLegends: false,
          dataMap: showChartData(),
          colorList: [Colors.greenAccent, Colors.blueAccent, Colors.redAccent],
          chartValueStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //
  Widget _itemConfirmed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Confirmados", style: TextStyle(fontSize: 18)),
        Obx(
          () => Text(
            _globalController.strConfirmedTotal.value,
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  //
  Widget _itemRecovered() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Recuperados", style: TextStyle(fontSize: 18)),
        Obx(
          () => Text(
            _globalController.strRecoveredTotal.value,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  //
  Widget _itemDeaths() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Mortes", style: TextStyle(fontSize: 18)),
        Obx(
          () => Text(
            _globalController.strDeathTotal.value,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  //
  Map<String, double> showChartData() {
    Map<String, double> res = Map();
    res.putIfAbsent(
        "Confirmados", () => _globalController.confirmedTotal.value.toDouble());
    res.putIfAbsent(
        "Recuperados", () => _globalController.recoveredTotal.value.toDouble());
    res.putIfAbsent(
        "Mortes", () => _globalController.deathTotal.value.toDouble());
    return res;
  }
  //
}
