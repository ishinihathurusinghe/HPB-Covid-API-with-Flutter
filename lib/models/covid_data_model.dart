

import 'package:hpb_covid_api/models/pcr_model.dart';

class CovidDataModel {
  int? totalDeaths;
  int? totalRecovered;
  int? totalCases;
  int? activeCases;
  List<PcrData>? pcrData;

  CovidDataModel(
      {this.activeCases,
      this.totalCases,
      this.totalDeaths,
      this.totalRecovered,
      this.pcrData});

  factory CovidDataModel.fromJson(Map<String, dynamic> json) {
    List<PcrData> pcrDataList = (json['daily_pcr_testing_data'] as List)
        .map((e) => PcrData.fromJson(e))
        .toList();

    return CovidDataModel(
      activeCases: json['local_active_cases'],
      totalCases: json['local_total_cases'],
      totalDeaths: json['local_deaths'],
      totalRecovered: json['local_recovered'],
      pcrData: pcrDataList,
    );
  }
}