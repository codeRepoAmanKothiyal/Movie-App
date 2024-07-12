import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_service/api_service.dart';
import '../widgets/t_page_widgets.dart';
import '../widgets/trending_movies_slider.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}


class _TrendingState extends State<Trending> {

  late Future<List>trendingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Trending Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),
              ),
              FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child:  Text(snapshot.error.toString()),
                    );
                  }else if (snapshot.hasData){
                    //final data = snapshot.data;
                    return TrendingMoviesPage(snapshot: snapshot,);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
