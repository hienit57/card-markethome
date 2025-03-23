import 'package:card_markethome/index.dart';

class MarshopRepositoryImpl extends MarshopRepository {
  @override
  Future<MarshopsReponse?> fetchMarshops({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'pageSize': pageSize,
      };

      final response = await ApiDioHelper().get(
        AppUrl.fetchMarshop,
        request: queryParameters,
      );

      return MarshopsReponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }

  @override
  Future<MarshopModel?> fetchMarshopByUserId({
    required String pdoneId,
  }) async {
    try {
      final queryParameters = {
        'pdoneId': pdoneId,
      };

      final response = await ApiDioHelper().get(
        AppUrl.fetchMarshopByUserId,
        request: queryParameters,
      );

      return MarshopModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }
}
