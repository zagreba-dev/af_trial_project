import 'package:af_trial_project/entity/movie.dart';
import 'package:json_annotation/json_annotation.dart';

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
}
