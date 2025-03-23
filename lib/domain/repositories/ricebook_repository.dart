import 'package:card_markethome/domain/index.dart';

abstract class RicebookRepository {
  Future<PackagesRiceBookResponse?> fetchRiceBookPackages({
    required int page,
    required int pageSize,
  });
}
