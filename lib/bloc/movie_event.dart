part of 'movie_bloc.dart';

abstract class MovieEvent {}

class MovieFetched extends MovieEvent {}

class MovieRetried extends MovieEvent {}
