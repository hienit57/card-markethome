import 'parse_model.dart';

class BaseResponseModel<T> {
  int? statusCode;
  String? message;
  String? code;
  T? data;
  dynamic errorDetails;

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      statusCode = json['statusCode'];
      message = json['message'];
      code = json['code'];
      errorDetails = json['errorDetails'];
      data = json['data'] != null
          ? MapperModel.getProperDataValue<T>(json['data'])
          : MapperModel.getProperDataValue<T>(json);
    } on Exception catch (_) {
      rethrow;
    }
  }

  bool isSuccess() {
    return statusCode == null;
  }
}
