import 'package:codemagic_flutter_cicd/animal_use_case.dart';
import 'package:codemagic_flutter_cicd/api.dart';
import 'package:codemagic_flutter_cicd/bloc.dart';
import 'package:codemagic_flutter_cicd/my_home_page.dart';
import 'package:codemagic_flutter_cicd/remote_source_repository.dart';
import 'package:codemagic_flutter_cicd/remote_source_repositoryImpl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

var getIt = GetIt.instance;

void main() {
  getIt.registerFactory<Api>(() => Api(Dio()));
  getIt.registerFactory<RemoteSourceRepository>(() => RemoteSourceRepositoryImpl(getIt.get<Api>()));
  getIt.registerFactory<AnimalUseCase>(() => AnimalUseCase(getIt.get<RemoteSourceRepository>()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => Bloc(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: ChangeNotifierProvider<Bloc>(
                create: (context) => Bloc(),
                builder: (context, snapshot) {
                  return MyHomePage(title: 'Flutter Demo Home Page');
                }),
          );
        });
  }
}
