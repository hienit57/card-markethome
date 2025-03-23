import 'package:card_markethome/domain/index.dart';

class UserProfileUsecase {
  UserProfileUsecase({
    required UserProfileRepository repository,
  }) : _userProfileRepository = repository;

  final UserProfileRepository _userProfileRepository;

  Future<UserProfileReponse?> fetchUserProfile() async =>
      await _userProfileRepository.fetchUserProfile();
}
