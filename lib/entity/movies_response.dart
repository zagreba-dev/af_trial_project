// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:af_trial_project/entity/movie.dart';

part 'movies_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MoviesResponse {
  final int pages;
  final int total;
  @JsonKey(name: 'results')
  final List<Movie> movies;

  MoviesResponse({
    required this.pages,
    required this.total,
    required this.movies,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);

  @override
  bool operator ==(covariant MoviesResponse other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.pages == pages &&
        other.total == total &&
        listEquals(other.movies, movies);
  }

  @override
  int get hashCode => pages.hashCode ^ total.hashCode ^ movies.hashCode;
}
