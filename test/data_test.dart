import 'package:card_markethome/domain/index.dart';

final characterList1 = [
  Character(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    type: 'Super genius',
    gender: 'Male',
    origin: Location(name: 'Earth', url: 'https://example.com/earth'),
    location: Location(name: 'Earth', url: 'https://example.com/earth'),
    image: 'https://example.com/rick.png',
    episode: ['https://example.com/episode1', 'https://example.com/episode2'],
    url: 'https://example.com/character/1',
    created: DateTime.parse('2022-01-01T12:00:00Z'),
  ),
  Character(
    id: 2,
    name: 'Morty Smith',
    status: 'Alive',
    species: 'Human',
    type: 'Sidekick',
    gender: 'Male',
    origin: Location(name: 'Earth', url: 'https://example.com/earth'),
    location: Location(name: 'Earth', url: 'https://example.com/earth'),
    image: 'https://example.com/morty.png',
    episode: ['https://example.com/episode1', 'https://example.com/episode3'],
    url: 'https://example.com/character/2',
    created: DateTime.parse('2022-01-02T12:00:00Z'),
  ),
];

final characterList2 = [
  Character(
    id: 3,
    name: 'Summer Smith',
    status: 'Alive',
    species: 'Human',
    type: 'Teenager',
    gender: 'Female',
    origin: Location(name: 'Earth', url: 'https://example.com/earth'),
    location: Location(name: 'Earth', url: 'https://example.com/earth'),
    image: 'https://example.com/summer.png',
    episode: ['https://example.com/episode1', 'https://example.com/episode4'],
    url: 'https://example.com/character/3',
    created: DateTime.parse('2022-01-03T12:00:00Z'),
  ),
  Character(
    id: 4,
    name: 'Jerry Smith',
    status: 'Alive',
    species: 'Human',
    type: 'Father',
    gender: 'Male',
    origin: Location(name: 'Earth', url: 'https://example.com/earth'),
    location: Location(name: 'Earth', url: 'https://example.com/earth'),
    image: 'https://example.com/jerry.png',
    episode: ['https://example.com/episode1', 'https://example.com/episode5'],
    url: 'https://example.com/character/4',
    created: DateTime.parse('2022-01-04T12:00:00Z'),
  ),
];