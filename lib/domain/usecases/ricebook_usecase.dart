import 'package:card_markethome/domain/index.dart';

class RicebookUsecase {
  RicebookUsecase({
    required RicebookRepository repository,
  }) : _ricebookRepository = repository;

  final RicebookRepository _ricebookRepository;

  Future<PackagesRiceBookResponse?> fetchRiceBookPackages({
    int page = 1,
    int pageSize = 10,
  }) async =>
      await _ricebookRepository.fetchRiceBookPackages(
        page: page,
        pageSize: pageSize,
      );
}
