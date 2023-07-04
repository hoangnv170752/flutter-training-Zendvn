import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson_themoviedb/models/movie.dart';

class MovieRepository {
  Future<void> getMoviePopularApi() async {
    const token = "";
    const url =
        "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final Map data = jsonDecode(response.body);
    final List<dynamic> result = data['result'];
  }
}
