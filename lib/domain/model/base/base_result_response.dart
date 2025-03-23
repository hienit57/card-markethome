class BaseResultResponse {
  final bool? result;

  BaseResultResponse({
    this.result,
  });

  BaseResultResponse.fromJson(Map<String, dynamic> json)
      : result = json['result'] as bool?;

  Map<String, dynamic> toJson() => {'result': result};
}
