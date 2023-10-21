import 'package:codemagic_flutter_cicd/api.dart';
import 'package:codemagic_flutter_cicd/model.dart';
import 'package:codemagic_flutter_cicd/remote_source_repository.dart';

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
