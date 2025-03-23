import 'package:equatable/equatable.dart';

class Location with EquatableMixin {
  Location({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  @override
  List<Object?> get props => [
        name,
        url,
      ];

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    name: json['name'],
    url: json['url'],
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'url': url,
  };
}
