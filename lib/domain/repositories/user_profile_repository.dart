import '../../index.dart';

abstract class UserProfileRepository {
  Future<UserProfileReponse?> fetchUserProfile();
}
