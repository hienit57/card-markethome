import 'package:card_markethome/domain/index.dart';

class CharacterUseCase {
  CharacterUseCase({
    required CharacterRepository repository,
  }) : _characterRepository = repository;

  final CharacterRepository _characterRepository;

  Future<List<Character>> getCharacterAction({required int page}) async =>
      await _characterRepository.getCharacters(page: page);
}
