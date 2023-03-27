// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      releaseYear: json['release_year'] as int,
      mpaRating: json['mpa_rating'] as String,
      imdbRating: (json['imdb_rating'] as num).toDouble(),
      duration: json['duration'] as int,
      poster: json['poster'] as String,
      bgPicture: json['bg_picture'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      directors: (json['directors'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      writers: (json['writers'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      stars: (json['stars'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'release_year': instance.releaseYear,
      'mpa_rating': instance.mpaRating,
      'imdb_rating': instance.imdbRating,
      'duration': instance.duration,
      'poster': instance.poster,
      'bg_picture': instance.bgPicture,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'directors': instance.directors.map((e) => e.toJson()).toList(),
      'writers': instance.writers.map((e) => e.toJson()).toList(),
      'stars': instance.stars.map((e) => e.toJson()).toList(),
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
