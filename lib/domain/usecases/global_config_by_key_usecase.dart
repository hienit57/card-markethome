import 'package:card_markethome/domain/index.dart';

class GlobalConfigByKeyUsecase {
  GlobalConfigByKeyUsecase({
    required GlobalConfigByKeyRepository repository,
  }) : _globalConfigByKeyRepository = repository;

  final GlobalConfigByKeyRepository _globalConfigByKeyRepository;

  Future<GlobalConfigByKeyReponse?> fetchItemsGlobalConfigByKey(
          String key) async =>
      await _globalConfigByKeyRepository.fetchItemsGlobalConfigByKey(key);
}
