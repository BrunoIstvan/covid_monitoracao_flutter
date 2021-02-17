import 'package:covid_19_worldwide/models/countries_model.dart';
import 'package:covid_19_worldwide/models/detail_country_model.dart';
import 'package:covid_19_worldwide/models/global_model.dart';
import 'package:covid_19_worldwide/repositories/covid_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalController extends GetxController {
  //
  CovidRepository repository;
  //
  GlobalController({this.repository});
  //
  var globalEntity = MonitoringModel().obs;
  var _countryEntity = CountriesModel().obs;
  var _detailCountryEntity = DetailCountryModel().obs;

  //for global
  var lastUpdate = "-".obs;
  var confirmedTotal = 0.0.obs;
  var recoveredTotal = 0.0.obs;
  var deathTotal = 0.0.obs;
  var strConfirmedTotal = "".obs;
  var strRecoveredTotal = "".obs;
  var strDeathTotal = "".obs;

  //for dropdown data
  var countries = [].obs;
  var selectedCountries = "BRA".obs;
  var countryDetailConfirmed = 0.obs;
  var countryDetailRecovered = 0.obs;
  var countryDetailDeaths = 0.obs;
  var strCountryDetailConfirmed = "".obs;
  var strCountryDetailRecovered = "".obs;
  var strCountryDetailDeaths = "".obs;

  //for checking success or not
  var isSelectedCountrySuccess = false.obs;

  // final _numberFormat = NumberFormat("#.###");

  @override
  void onInit() {
    //
    print("GlobalController - onInit");
    fetchData();
    super.onInit();
    //
  }

  fetchData() {
    _fetchGlobalData();
    _fetchCountries();
    _fetchCountrySelected();
  }

  @override
  void onReady() {
    //
    ever(selectedCountries, (_) {
      print("onready called , ${selectedCountries.value}");
      _fetchCountrySelected();
    });
    super.onReady();
    //
  }

  void _fetchGlobalData() async {
    //
    try {
      globalEntity.value = await repository.loadGlobalData();

      lastUpdate.value = DateFormat('dd/MM/yyyy HH:mm:ss')
          .format(DateTime.parse(globalEntity.value.lastUpdate));

      confirmedTotal.value = globalEntity.value.confirmed.value.toDouble();
      recoveredTotal.value = globalEntity.value.recovered.value.toDouble();
      deathTotal.value = globalEntity.value.deaths.value.toDouble();

      strConfirmedTotal.value =
          _formatNumber(globalEntity.value.confirmed.value.toDouble());
      strRecoveredTotal.value =
          _formatNumber(globalEntity.value.recovered.value.toDouble());
      strDeathTotal.value =
          _formatNumber(globalEntity.value.deaths.value.toDouble());
    } catch (_) {
      debugPrint("GlobalController._fetchGlobalData - onCatch error ");
    }
    //
  }

  String _formatNumber(double number) {
    final numberFormat = number < 1000
        ? NumberFormat("0", 'pt_BR')
        : NumberFormat("0,000", 'pt_BR');
    return numberFormat.format(number);
  }

  void _fetchCountries() async {
    //
    try {
      _countryEntity.value = await repository.loadCountries();
      countries.assignAll(_countryEntity.value.countries);
    } catch (_) {
      debugPrint("GlobalController._fetchCountries - onCatch error ");
    }
    //
  }

  void _fetchCountrySelected() async {
    //
    try {
      var data = await repository.loadSelectedCountry(selectedCountries.value);
      print("data is $data");

      isSelectedCountrySuccess.value = true;
      _detailCountryEntity.value = data;
      countryDetailConfirmed.value = _detailCountryEntity.value.confirmed.value;
      countryDetailRecovered.value = _detailCountryEntity.value.recovered.value;
      countryDetailDeaths.value = _detailCountryEntity.value.deaths.value;

      strCountryDetailConfirmed.value =
          _formatNumber(_detailCountryEntity.value.confirmed.value.toDouble());
      strCountryDetailRecovered.value =
          _formatNumber(_detailCountryEntity.value.recovered.value.toDouble());
      strCountryDetailDeaths.value =
          _formatNumber(_detailCountryEntity.value.deaths.value.toDouble());

      print("_fetchCountrySelected value ${countryDetailConfirmed.value}");
    } catch (_) {
      debugPrint("GlobalController._fetchCountrySelected() - onCatch error ");
      isSelectedCountrySuccess.value = false;
      countryDetailConfirmed.value = 0;
      countryDetailRecovered.value = 0;
      countryDetailDeaths.value = 0;
      strCountryDetailConfirmed.value = '';
      strCountryDetailRecovered.value = '';
      strCountryDetailDeaths.value = '';
    }
    //
  }
  //
}
