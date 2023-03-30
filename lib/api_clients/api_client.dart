import 'dart:async';
import 'dart:convert';
import 'package:af_trial_project/entity/movies_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final httpClient = http.Client();

  Future<MoviesResponse> fetchMoviesList([int pageQuery = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'live.mocat.amifactory.network',
        '/api/v1/movies/',
        <String, dynamic>{
          'page': '$pageQuery',
        },
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map;
      return MoviesResponse.fromJson(body as Map<String, dynamic>);
    }
    throw Exception('error fetching movies');
  }
}
