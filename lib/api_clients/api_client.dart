import 'dart:async';
import 'dart:convert';
import 'package:af_trial_project/entity/movies_response.dart';
import 'package:http/io_client.dart';
import 'dart:io';

class ApiClient {
  final httpClient = HttpClient();

  static const host = 'live.mocat.amifactory.network';

  Future<MoviesResponse> fetchMoviesList([int pageQuery = 0]) async {
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) {
      final isValidHost = host == ApiClient.host;
      return isValidHost;
    });
    final http = IOClient(httpClient);
    final response = await http.get(
      Uri.https(
        host,
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
