import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_flix_app/widgets_for_two/trending_widget.dart';

import '../api_service/api_service.dart';
import '../constants.dart';
//import '../widgets/t_page_widgets.dart';

class TrendingMovies2 extends StatefulWidget {
  const TrendingMovies2({super.key});

  @override
  State<TrendingMovies2> createState() => _TrendingMovies2State();
}

class _TrendingMovies2State extends State<TrendingMovies2> {
  late Future<List>trendingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Text("Trending Movies",
            style: TextStyle(
                fontSize: 30,
                color: Colors.blue
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
      body: FutureBuilder(
        future: trendingMovies,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child:  Text(snapshot.error.toString()),
            );
          }else if (snapshot.hasData){
            //final data = snapshot.data;
            return  GridView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return Container(
                  child: Image.network("${Constants.imagePath}${snapshot.data?[index].posterPath}"),
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
