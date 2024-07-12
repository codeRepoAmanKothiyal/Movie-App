import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/model_movies.dart';

class Api {

  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  Future<List<Movies?>> getTrendingMovies() async {

    final response = await http.get(Uri.parse(_trendingUrl)); // get Req
    {
      if(response.statusCode==200){
        final decodedData = json.decode(response.body)['results'] as List;
        print(decodedData);
        return decodedData.map((movies) => Movies.fromJson(movies)).toList();
      }else{
        throw Exception("Somthing Happend");
      }
    }
  }

  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  Future<List<Movies?>> getTopRatedMovies() async {

    final response = await http.get(Uri.parse(_topRatedUrl)); // get Req
        {
      if(response.statusCode==200){
        final decodedData = json.decode(response.body)['results'] as List;
        print(decodedData);
        return decodedData.map((movies) => Movies.fromJson(movies)).toList();
      }else{
        throw Exception("Somthing Happend");
      }
    }
  }

  static const _upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movies?>> getUpcomingMovies() async {

    final response = await http.get(Uri.parse(_upcomingUrl)); // get Req
        {
      if(response.statusCode==200){
        final decodedData = json.decode(response.body)['results'] as List;
        print(decodedData);
        return decodedData.map((movies) => Movies.fromJson(movies)).toList();
      }else{
        throw Exception("Somthing Happend");
      }
    }
  }
}