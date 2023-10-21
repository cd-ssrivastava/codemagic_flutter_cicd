import 'package:codemagic_flutter_cicd/model.dart';
import 'package:codemagic_flutter_cicd/remote_source_repository.dart';

class AnimalUseCase {
  RemoteSourceRepository remoteSourceRepository;

  AnimalUseCase(this.remoteSourceRepository);

  Future<List<Model>> getApiData() async {
    List<Model> list = await remoteSourceRepository.getApiData();

    return list;
  }
}
