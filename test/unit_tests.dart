import 'dart:io';

import 'package:codemagic_flutter_cicd/Api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements Dio {}

void main() {
  group("Api Testing", () {
    test("Api Success testing", () {
      Api api = Api(Dio());

      api.getApiData().then((value) {
        expect(value, isA<Map>());
      });
    });

/*    test("Api Failure testing", () async {
      Dio mockDio = MockApiService();
      Api api = Api(mockDio);

      when(api.getApiData()).thenAnswer((_) => throw  SocketException("No Internet"));

      expect(  api.getApiData(), throwsA(isA<Exception>()));

      // throwsA(isA<Exception>())
      // throwsException
      // throwsA(isA<DioException>())
      // throwsA(isA<AppError>())
      // expect(api.getApiData(), throwsA(isA<DioException>()));  // Use when Api func throws Exception
    });*/

    test("RemoteSourceRepository", () {
     /* Api api = Api();
      api.getApiData().then((value) {
        expect(value, isA<Map>());
      });*/
    });
  });
}
