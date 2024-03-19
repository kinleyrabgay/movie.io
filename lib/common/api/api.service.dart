import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieio/common/api/api.config.dart';
import 'package:movieio/common/entities/tmdb.movie.dart';
import 'package:movieio/common/entities/tmdb.movie.review.dart';

class MovieServices {
  static Future<List<Movie>?> getTopRatedMovies() async {
    List<Movie> movies = [];
    try {
      var response = await http.get(Uri.parse(
          '${ApiConfig.baseUrl}/movie/top_rated?api_key=${ApiConfig.apiKey}&include_adult=false&language=en-US&page=1'));

      var res = jsonDecode(response.body);
      res['results'].skip(6).take(4).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getTrendingMovies() async {
    List<Movie> movies = [];
    try {
      var response = await http.get(Uri.parse(
          '${ApiConfig.baseUrl}/trending/movie/day?api_key=${ApiConfig.apiKey}&include_adult=false&language=en-US&page=1'));

      var res = jsonDecode(response.body);
      res['results'].skip(6).take(4).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getPopularMovies() async {
    List<Movie> movies = [];
    try {
      var response = await http.get(Uri.parse(
          '${ApiConfig.baseUrl}/popular/movie/api_key=${ApiConfig.apiKey}&include_adult=false&language=en-US&page=1'));

      var res = jsonDecode(response.body);
      res['results'].skip(6).take(4).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getCustomMovies(String url) async {
    List<Movie> movies = [];
    try {
      http.Response response =
          await http.get(Uri.parse('${ApiConfig.baseUrl}/movie/$url'));
      var res = jsonDecode(response.body);
      res['results'].take(6).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getSearchedMovies(String query) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=${ApiConfig.apiKey}&language=en-US&query=$query&page=1&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (m) => movies.add(
          Movie.fromMap(m),
        ),
      );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Review>?> getMovieReviews(int movieId) async {
    List<Review> reviews = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=${ApiConfig.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (r) {
          reviews.add(
            Review(
                author: r['author'],
                comment: r['content'],
                rating: r['author_details']['rating']),
          );
        },
      );
      return reviews;
    } catch (e) {
      return null;
    }
  }

  static Future fetchMovies(String api) async {
    var res = await http.get(Uri.parse(api));
    var decodeRes = jsonDecode(res.body);
    return decodeRes;
  }
}
