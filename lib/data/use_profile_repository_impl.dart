import '../index.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl();

  @override
  Future<UserProfileReponse?> fetchUserProfile() async {
    try {
      final response = await ApiDioHelper().get(
        AppUrl.fetchUserProfile,
      );

      return UserProfileReponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return null;
      } else {}
    }

    return null;
  }
}
