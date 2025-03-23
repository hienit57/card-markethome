import '../../index.dart';

abstract class MarshopRepository {
  Future<MarshopsReponse?> fetchMarshops({
    int page = 1,
    int pageSize = 10,
  });

  Future<MarshopModel?> fetchMarshopByUserId({
    required String pdoneId,
  });
}
