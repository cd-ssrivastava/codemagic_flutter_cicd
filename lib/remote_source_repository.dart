

import 'package:codemagic_flutter_cicd/model.dart';

abstract class RemoteSourceRepository{
  Future<List<Model>> getApiData();
}