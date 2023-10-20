import 'package:codemagic_flutter_cicd/Model.dart';
import 'package:codemagic_flutter_cicd/RemoteSourceRepository.dart';

class AnimalUseCase {
  RemoteSourceRepository remoteSourceRepository;

  AnimalUseCase(this.remoteSourceRepository);

  Future<List<Model>> getApiData() async {
    List<Model> list = await remoteSourceRepository.getApiData();

    return list;
  }
}
