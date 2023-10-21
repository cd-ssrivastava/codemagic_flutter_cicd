import 'package:dio/dio.dart';

import 'utils.dart';
 
class Api {
  Dio dio;

  Api(this.dio);

  Future<Map<String, dynamic>?> getApiData() async {
    Response<Map<String, dynamic>> response = await dio.get("https://datausa.io/api/data?drilldowns=Nation&measures=Population");
    printLog(response.data);
    return response.data;
  }
}
