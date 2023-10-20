import 'dart:io';

import 'package:dio/dio.dart';

class Api {
  Dio dio;

  Api(this.dio);

  Future<Map<String, dynamic>?> getApiData() async {
    Response<Map<String, dynamic>> response = await dio.get("https://datausa.io/api/data?drilldowns=Nation&measures=Population");
    print(response.data);
    return response.data;
  }
}
