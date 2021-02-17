import 'package:covid_19_worldwide/controllers/bindings/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonGeneralCaseWidget extends StatelessWidget {
  //
  final GlobalController _globalController = Get.find<GlobalController>();
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _detailSelectedCountry(),
    );
  }

  //
  Widget _detailSelectedCountry() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _confirmedItem(),
          _dividerItem(),
          _recoveredItem(),
          _dividerItem(),
          _deathsItem(),
        ],
      ),
    );
  }

  //
  Widget _confirmedItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Confirmados", style: TextStyle(fontSize: 18)),
          Padding(padding: EdgeInsets.only(top: 8)),
          Obx(
            () => _totalOfCase(
                _globalController.strCountryDetailConfirmed.value,
                Colors.greenAccent),
          )
        ],
      ),
    );
  }

  //
  Widget _recoveredItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Recuperados", style: TextStyle(fontSize: 18)),
          Padding(padding: EdgeInsets.only(top: 8)),
          Obx(() => _totalOfCase(
              _globalController.strCountryDetailRecovered.value,
              Colors.blueAccent))
        ],
      ),
    );
  }

  //
  Widget _deathsItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Mortes", style: TextStyle(fontSize: 18)),
          Padding(padding: EdgeInsets.only(top: 8)),
          Obx(() => _totalOfCase(
              _globalController.strCountryDetailDeaths.value, Colors.redAccent))
        ],
      ),
    );
  }

  //
  Widget _totalOfCase(String total, Color textColor) {
    return Text(
      total,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  //
  Widget _dividerItem() {
    return Container(
      color: Colors.black45,
      width: 1.0,
      height: Get.height * 0.05,
    );
  }

  //
}
