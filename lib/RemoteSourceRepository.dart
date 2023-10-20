

import 'package:codemagic_flutter_cicd/Model.dart';

abstract class RemoteSourceRepository{
  Future<List<Model>> getApiData();
}