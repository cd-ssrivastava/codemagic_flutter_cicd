import 'package:codemagic_flutter_cicd/AnimalUseCase.dart';
import 'package:codemagic_flutter_cicd/Api.dart';
import 'package:codemagic_flutter_cicd/Bloc.dart';
import 'package:codemagic_flutter_cicd/MyHomePage.dart';
import 'package:codemagic_flutter_cicd/RemoteSourceRepository.dart';
import 'package:codemagic_flutter_cicd/RemoteSourceRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

var getIt = GetIt.instance;

void main() {
  getIt.registerFactory<Api>(() => Api());
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
