import 'package:equatable/equatable.dart';

import 'location.dart';

class Character with EquatableMixin {
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Location? origin;
  final Location? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin:
            json['origin'] == null ? null : Location.fromMap(json['origin']),
        location: json['location'] == null
            ? null
            : Location.fromMap(json['location']),
        image: json['image'],
        episode: json['episode'] == null
            ? []
            : List<String>.from(json['episode']!.map((dynamic x) => x)),
        url: json['url'],
        created:
            json['created'] == null ? null : DateTime.parse(json['created']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': origin?.toMap(),
        'location': location?.toMap(),
        'image': image,
        'episode': episode == null
            ? [null]
            : List<dynamic>.from(episode!.map((x) => x)),
        'url': url,
        'created': created?.toIso8601String(),
      };
}

extension CharacterExt on Character {
  String get getName => name ?? '';

  bool get isAlive => status == 'Alive';
}
