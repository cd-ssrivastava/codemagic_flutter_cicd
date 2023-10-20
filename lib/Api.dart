import 'package:dio/dio.dart';

class Api {
  Future<Map<String,dynamic>?> getApiData() async {
    Dio dio = Dio();
    Response<Map<String,dynamic>> response = await dio.get("https://datausa.io/api/data?drilldowns=Nation&measures=Population");
    print(response.data);
    return response.data;
  }
}
