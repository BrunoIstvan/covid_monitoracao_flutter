import 'dart:convert';

import 'package:covid_19_worldwide/models/countries_model.dart';
import 'package:covid_19_worldwide/models/detail_country_model.dart';
import 'package:covid_19_worldwide/models/global_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CovidRepository {
  //
  final String baseUrl = "https://covid19.mathdro.id/api";
  //
  Future<MonitoringModel> loadGlobalData() async {
    //
    try {
      var data = await _get("");
      return MonitoringModel.fromJson(data);
    } catch (_) {
      debugPrint("CovidRepository - onCatch error ");
      throw Exception('CovidRepository.loadGlobalData() - onCatch error ');
    }
    //
  }

  //
  Future<CountriesModel> loadCountries() async {
    //
    try {
      var data = await _get("countries");
      return CountriesModel.fromJson(data);
    } catch (_) {
      debugPrint("CovidRepository - onCatch error ");
      throw Exception('CovidRepository.loadCountries() - onCatch error ');
    }
    //
  }

  //
  Future<DetailCountryModel> loadSelectedCountry(iso3) async {
    //
    try {
      var data = await _get("countries/$iso3");
      return DetailCountryModel.fromJson(data);
    } catch (_) {
      debugPrint("CovidRepository - onCatch error ");
      throw Exception('CovidRepository.loadSelectedCountry() - onCatch error ');
    }
    //
  }

  //
  Future<Map<String, dynamic>> _get(String partUrl) async {
    //
    final fullUrl = '$baseUrl/$partUrl';
    debugPrint("CovidRepository - fullUrl : $fullUrl");
    final response = await http.get(fullUrl);
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
    //
  }

  //
  Future<Map<String, dynamic>> _processResponse(Response response) async {
    //
    final body = response?.body ?? "";
    //
    if (body.isNotEmpty) {
      return json.decode(body);
    } else {
      print("processResponse error");
      throw Exception('CovidRepository._processResponse() - onCatch error ');
    }
    //
  }
  //

}
