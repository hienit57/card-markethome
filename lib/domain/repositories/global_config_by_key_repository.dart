import '../../index.dart';

abstract class GlobalConfigByKeyRepository {
  Future<GlobalConfigByKeyReponse?> fetchItemsGlobalConfigByKey(String key);
}
