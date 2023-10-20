import 'dart:io';

import 'package:codemagic_flutter_cicd/Api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test("Api Success testing", () {
    Api api = Api();

    api.getApiData().then((value) {
      expect(value, isA<Map>());
    });
  });

  test("Api Failure testing", () async {
    Api api = Api();

    /*   when(api.getApiData())
        .thenAnswer((_) => throw SocketException("No Internet"));
        */

    // throwsA(isA<Exception>())
    // throwsException
    // throwsA(isA<DioException>())
    expect(api.getApiData(), throwsA(isA<DioException>()));


  });

  test("RemoteSourceRepository", () {
    Api api = Api();
    api.getApiData().then((value) {
      expect(value, isA<Map>());
    });
  });
}
