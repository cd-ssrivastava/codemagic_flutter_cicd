import 'package:codemagic_flutter_cicd/Api.dart';
import 'package:codemagic_flutter_cicd/Model.dart';
import 'package:codemagic_flutter_cicd/RemoteSourceRepository.dart';

class RemoteSourceRepositoryImpl implements RemoteSourceRepository {
  Api api;
  RemoteSourceRepositoryImpl(this.api);
  @override
  Future<List<Model>> getApiData() async {
    Map<String, dynamic> json = (await api.getApiData()) ?? {};

    List<dynamic> list = json["data"];
    List<Model> modelList = [];

    for (var element in list) {
      modelList.add(Model.fromJson(element));
    }

    return modelList;
  }
}
