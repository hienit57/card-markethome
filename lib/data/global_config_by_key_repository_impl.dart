import '../index.dart';

class GlobalConfigByKeyRepositoryImpl implements GlobalConfigByKeyRepository {
  GlobalConfigByKeyRepositoryImpl();

  @override
  Future<GlobalConfigByKeyReponse?> fetchItemsGlobalConfigByKey(
      String key) async {
    try {
      final response = await ApiDioHelper().get(
        '${AppUrl.fetchGlobalConfigByKey}$key',
      );

      return GlobalConfigByKeyReponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }
}
