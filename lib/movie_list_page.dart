import 'package:flutter/material.dart';
import 'package:movies_imdb/movie_list_viewmodel.dart';
import 'package:provider/provider.dart';

import 'movie_list.dart';
class MovieListPage extends StatefulWidget {

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  final TextEditingController _controller=TextEditingController();

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final vm=Provider.of<MovieListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: (value){
                if(value.isNotEmpty){
                  vm.fetchMovies(value);
                  _controller.clear();
                }
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(child: MovieList(movies: vm.movies))
        ],),
      ),


    );
  }
}
