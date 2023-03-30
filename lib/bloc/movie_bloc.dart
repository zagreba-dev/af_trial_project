import 'package:af_trial_project/api_clients/api_client.dart';
import 'package:af_trial_project/entity/movie.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

part 'movie_event.dart';
part 'movie_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required this.httpClient}) : super(const MovieState()) {
    on<MovieFetched>(
      _onMovieFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<MovieRetried>(_onMovieRetried);
  }

  final ApiClient httpClient;

  Future<void> _onMovieFetched(
    MovieFetched event,
    Emitter<MovieState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == MovieStatus.initial) {
        final moviesResponse = await httpClient.fetchMoviesList();
        return emit(
          state.copyWith(
            status: MovieStatus.success,
            movies: moviesResponse.movies,
            totalPages: moviesResponse.pages,
            hasReachedMax: false,
          ),
        );
      }
      final moviesResponse =
          await httpClient.fetchMoviesList(state.currentPage + 1);
      emit(
        state.copyWith(
          status: MovieStatus.success,
          movies: List.of(state.movies)..addAll(moviesResponse.movies),
          currentPage: state.currentPage + 1,
          hasReachedMax:
              state.currentPage + 1 < state.totalPages - 1 ? false : true,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  void _onMovieRetried(
    MovieRetried event,
    Emitter<MovieState> emit,
  ) {
    emit(
      state.copyWith(
        status: MovieStatus.initial,
        movies: const <Movie>[],
        currentPage: 0,
        totalPages: 1,
        hasReachedMax: false,
      ),
    );
  }
}
