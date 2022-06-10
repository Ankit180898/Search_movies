import 'package:flutter/cupertino.dart';
import 'package:movies_imdb/web_service.dart';
import 'movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier{
  List<MovieViewModel> movies=[];

  Future<void> fetchMovies(String keyword) async{
    final results=await WebService().fetchMovie(keyword);
    movies=results.map((item) => MovieViewModel(movie: item) ).toList();
    print(movies);
    notifyListeners();
  }




}

