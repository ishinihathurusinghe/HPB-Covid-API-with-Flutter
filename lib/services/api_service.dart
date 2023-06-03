import 'dart:convert';


//import 'package:http/http.dart';

import '../models/covid_data_model.dart';

class ApiService {
  final endpoint = "https://www.hpb.health.gov.lk/api/get-current-statistical";

  Future<CovidDataModel> getData() async {



    Response response = await get(Uri.parse(endpoint));
    
    
    
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> data = body['data'];
      CovidDataModel covidData = CovidDataModel.fromJson(data);
      return covidData;
    } else {
      throw Exception(response.statusCode);
    }
  }
}