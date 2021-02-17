import 'package:covid_19_worldwide/controllers/bindings/global_controller.dart';
import 'package:covid_19_worldwide/widgets/global_case_widget.dart';
import 'package:covid_19_worldwide/widgets/selected_country_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  //
  final GlobalController _globalController = Get.find<GlobalController>();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  //
  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 8),
        child: Column(
          children: <Widget>[
            _buildLastUpdateItem(),
            GlobalCaseWidget(),
            _buildSelectedCountryCaseWidget(),
          ],
        ),
      ),
    );
  }

  //
  AppBar _buildAppBar() {
    return AppBar(
      title: Text("COVID-19 Monitoração"),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () => _globalController.fetchData(),
        ),
      ],
    );
  }

  //
  Widget _buildLastUpdateItem() {
    return Container(
      child: Obx(
        () => Text("Última atualização: ${_globalController.lastUpdate.value}"),
      ),
    );
  }

  //
  Widget _buildSelectedCountryCaseWidget() {
    //
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 8.0,
            spreadRadius: 0.8,
          ),
        ],
      ),
      height: Get.height * 0.3,
      width: Get.width * 1,
      child: SelectedCountryWidget(),
    );
  }

  //
}
