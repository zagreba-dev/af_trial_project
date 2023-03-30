// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
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

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.releaseYear == releaseYear &&
        other.mpaRating == mpaRating &&
        other.imdbRating == imdbRating &&
        other.duration == duration &&
        other.poster == poster &&
        other.bgPicture == bgPicture &&
        listEquals(other.genres, genres) &&
        listEquals(other.directors, directors) &&
        listEquals(other.writers, writers) &&
        listEquals(other.stars, stars);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        releaseYear.hashCode ^
        mpaRating.hashCode ^
        imdbRating.hashCode ^
        duration.hashCode ^
        poster.hashCode ^
        bgPicture.hashCode ^
        genres.hashCode ^
        directors.hashCode ^
        writers.hashCode ^
        stars.hashCode;
  }
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

  @override
  bool operator ==(covariant Genre other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
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

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode => id.hashCode ^ firstName.hashCode ^ lastName.hashCode;
}
