import '../index.dart';

class RicebookRepositoryImpl implements RicebookRepository {
  RicebookRepositoryImpl();

  @override
  Future<PackagesRiceBookResponse?> fetchRiceBookPackages({
    required int page,
    required int pageSize,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'pageSize': pageSize,
      };

      final response = await ApiDioHelper().get(
        AppUrl.fetchRiceBookPackages,
        request: queryParameters,
      );
      return PackagesRiceBookResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {
        return null;
      }
    }

    return null;
  }
}
