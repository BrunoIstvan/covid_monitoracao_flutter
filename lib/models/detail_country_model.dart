import 'package:covid_19_worldwide/models/response_model.dart';

class DetailCountryModel {
  ResponseModel confirmed;
  ResponseModel recovered;
  ResponseModel deaths;
  String lastUpdate;

  DetailCountryModel({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.lastUpdate,
  });

  DetailCountryModel.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'] != null
        ? new ResponseModel.fromJson(json['confirmed'])
        : null;
    recovered = json['recovered'] != null
        ? new ResponseModel.fromJson(json['recovered'])
        : null;
    deaths = json['deaths'] != null
        ? new ResponseModel.fromJson(json['deaths'])
        : null;
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.confirmed != null) {
      data['confirmed'] = this.confirmed.toJson();
    }
    if (this.recovered != null) {
      data['recovered'] = this.recovered.toJson();
    }
    if (this.deaths != null) {
      data['deaths'] = this.deaths.toJson();
    }
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}
