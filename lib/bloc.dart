import 'package:codemagic_flutter_cicd/animal_use_case.dart';
import 'package:codemagic_flutter_cicd/model.dart';
import 'package:codemagic_flutter_cicd/remote_source_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'utils.dart';

var getIt = GetIt.instance;

class Bloc extends ChangeNotifier {
  List<Model> list = [];
  AnimalUseCase animalUseCase = AnimalUseCase(getIt.get<RemoteSourceRepository>());

  void getData() {
    animalUseCase.getApiData().then((value) {
      list=value;
      printLog("Bloc ${value}");
      notifyListeners();
    });
  }
}
