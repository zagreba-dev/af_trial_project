// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'movie_bloc.dart';

enum MovieStatus { initial, success, failure }

class MovieState {
  const MovieState({
    this.status = MovieStatus.initial,
    this.movies = const <Movie>[],
    this.currentPage = 0,
    this.totalPages = 1,
    this.hasReachedMax = false,
  });

  final MovieStatus status;
  final List<Movie> movies;
  final int currentPage;
  final int totalPages;
  final bool hasReachedMax;

  MovieState copyWith({
    MovieStatus? status,
    List<Movie>? movies,
    int? currentPage,
    int? totalPages,
    bool? hasReachedMax,
  }) {
    return MovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''MovieState { status: $status, currentPage: $currentPage, totalPages: $totalPages, hasReachedMax: $hasReachedMax, posts: ${movies.length} }''';
  }

  @override
  bool operator ==(covariant MovieState other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.status == status &&
        listEquals(other.movies, movies) &&
        other.currentPage == currentPage &&
        other.totalPages == totalPages &&
        other.hasReachedMax == hasReachedMax;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        movies.hashCode ^
        currentPage.hashCode ^
        totalPages.hashCode ^
        hasReachedMax.hashCode;
  }
}
