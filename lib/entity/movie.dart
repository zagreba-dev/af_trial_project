import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Movie {
  final int id;
  final String title;
  final String description;
  final int releaseYear;
  final String mpaRating;
  final double imdbRating;
  final int duration;
  final String poster;
  final String bgPicture;
  final List<Genre> genres;
  final List<Person> directors;
  final List<Person> writers;
  final List<Person> stars;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.releaseYear,
    required this.mpaRating,
    required this.imdbRating,
    required this.duration,
    required this.poster,
    required this.bgPicture,
    required this.genres,
    required this.directors,
    required this.writers,
    required this.stars,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  final int id;
  final String title;

  Genre({
    required this.id,
    required this.title,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Person {
  final int id;
  final String firstName;
  final String lastName;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
