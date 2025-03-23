class MiddleWareSetting {
  final String flavor;
  final Function(Map<String, dynamic>) onCallBack;

  final bool isDev;
  final String accessToken;
  final String refreshToken;

  MiddleWareSetting({
    required this.flavor,
    required this.isDev,
    required this.onCallBack,
    required this.accessToken,
    required this.refreshToken,
  });

  factory MiddleWareSetting.fromJson(Map<String, dynamic> json) {
    return MiddleWareSetting(
      flavor: json['flavor'],
      isDev: json['isDev'],
      onCallBack: json['onCallBack'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flavor': flavor,
      'isDev': isDev,
      'onCallBack': onCallBack,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
