import 'package:card_markethome/domain/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMapperModel extends Mock implements MapperModel {}

void main() {
  final mockMapperModel = MockMapperModel();
  
  group('Base Response', () {
    test('should parse JSON correctly with valid data', () {
      final json = {
        'statusCode': 200,
        'message': 'Success',
        'code': 'OK',
        'data': {'key': 'value'},
        'errorDetails': null
      };

      final response = BaseResponseModel<Map<String, dynamic>>.fromJson(json);

      expect(response.statusCode, 200);
      expect(response.message, 'Success');
      expect(response.code, 'OK');
      expect(response.data, {'key': 'value'});
      expect(response.errorDetails, null);
    });

    test('should handle null data field', () {
      final json = {'statusCode': 200, 'message': 'Success', 'code': 'OK', 'data': null, 'errorDetails': null};

      final response = BaseResponseModel<Map<String, dynamic>>.fromJson(json);

      expect(response.statusCode, 200);
      expect(response.message, 'Success');
      expect(response.code, 'OK');
      expect(response.data, isNull);
      expect(response.errorDetails, null);
    });

    test('should handle missing fields gracefully', () {
      final json = {'statusCode': 200, 'message': 'Success'};

      final response = BaseResponseModel<Map<String, dynamic>>.fromJson(json);

      expect(response.statusCode, 200);
      expect(response.message, 'Success');
      expect(response.code, isNull);
      expect(response.data, isNull);
      expect(response.errorDetails, isNull);
    });

    test('isSuccess should return true when statusCode is null', () {
      final json = {
        'message': 'Success',
        'code': 'OK',
        'data': {'key': 'value'},
        'errorDetails': null
      };

      final response = BaseResponseModel<Map<String, dynamic>>.fromJson(json);

      expect(response.isSuccess(), true);
    });

    test('isSuccess should return false when statusCode is not null', () {
      final json = {'statusCode': 400, 'message': 'Error', 'code': 'ERR', 'data': null, 'errorDetails': 'Some error details'};

      final response = BaseResponseModel<Map<String, dynamic>>.fromJson(json);

      expect(response.isSuccess(), false);
    });
  });
}
