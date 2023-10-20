import 'package:codemagic_flutter_cicd/AnimalUseCase.dart';
import 'package:codemagic_flutter_cicd/Model.dart';
import 'package:codemagic_flutter_cicd/RemoteSourceRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

class Bloc extends ChangeNotifier {
  List<Model> list = [];
  AnimalUseCase animalUseCase = AnimalUseCase(getIt.get<RemoteSourceRepository>());

  void getData() {
    animalUseCase.getApiData().then((value) {
      list=value;
      print("Bloc ${value}");
      notifyListeners();
    });
  }
}
