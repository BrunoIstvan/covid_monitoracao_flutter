import 'package:covid_19_worldwide/controllers/bindings/global_controller.dart';
import 'package:covid_19_worldwide/views/commons/common_general_case_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class DetailCountryView extends StatelessWidget {
  //
  final GlobalController _globalController = Get.find<GlobalController>();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${_globalController.selectedCountries.value} Detalhes de Casos"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildChart(),
            Padding(padding: EdgeInsets.only(top: 16)),
            CommonGeneralCaseWidget(),
          ],
        ),
      ),
    );
  }

  //
  Widget _buildChart() {
    return Container(
      child: Obx(
        () => PieChart(
          chartType: ChartType.ring,
          showLegends: true,
          dataMap: showChartData(),
          colorList: [Colors.greenAccent, Colors.blueAccent, Colors.redAccent],
          chartValueStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //
  Map<String, double> showChartData() {
    Map<String, double> res = Map();
    res.putIfAbsent("Confirmados",
        () => _globalController.countryDetailConfirmed.value.toDouble());
    res.putIfAbsent("Recuperados",
        () => _globalController.countryDetailRecovered.value.toDouble());
    res.putIfAbsent(
        "Mortes", () => _globalController.countryDetailDeaths.value.toDouble());
    return res;
  }
  //
}
