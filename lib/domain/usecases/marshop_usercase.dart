import 'package:card_markethome/index.dart';

class MarshopUsecase {
  MarshopUsecase({
    required MarshopRepository repository,
  }) : _marshopRepository = repository;

  final MarshopRepository _marshopRepository;

  Future<MarshopsReponse?> fetchMarshops({
    int page = 1,
    int pageSize = 10,
  }) async =>
      await _marshopRepository.fetchMarshops(
        page: page,
        pageSize: pageSize,
      );

  Future<MarshopModel?> fetchMarshopByUserId({
    required String pdoneId,
  }) async =>
      await _marshopRepository.fetchMarshopByUserId(
        pdoneId: pdoneId,
      );
}
