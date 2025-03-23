import 'package:card_markethome/domain/repositories/character_repository.dart';
import 'package:card_markethome/main.dart';
import 'package:dio/dio.dart';

import '../index.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl();

  @override
  Future<List<Character>> getCharacters({int page = 0}) async {
    /// chỗ này đúng ra phải dùng base dio, nhưng do api test ko trả về theo định dạng base response nên tạo 1 dio ngoài để parse json, cách sử dụng ko có gì khác nhau
    try {
      final Response<Map<String, dynamic>> response = await Dio()
          .get('${flavorSettings.apiBaseUrl}${AppUrl.endPointTest}$page');
      final l = (response.data!['results'] as List<dynamic>)
          .map((e) => Character.fromMap(e))
          .toList();
      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e);
      }
    }

    return [];
  }
}
