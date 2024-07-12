import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_service/api_service.dart';
import '../widgets/movies_slider.dart';
import '../widgets/trending_movies_slider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List>trendingMovies;
  late Future<List>topRatedMovies;
  late Future<List>upComingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpcomingMovies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Trending Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child:  Text(snapshot.error.toString()),
                      );
                    }else if (snapshot.hasData){
                      //final data = snapshot.data;
                      return TrendingMovies(snapshot: snapshot,);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                  "Top Rated",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white),
              ),
              const SizedBox(height: 30.0,),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child:  Text(snapshot.error.toString()),
                      );
                    }else if (snapshot.hasData){
                      //final data = snapshot.data;
                      return MoviesSlider(snapshot: snapshot,);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
              const SizedBox(height: 30.0,),
              Text(
                "Upcoming Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 30.0,),
              SizedBox(
                child: FutureBuilder(
                  future: upComingMovies,
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child:  Text(snapshot.error.toString()),
                      );
                    }else if (snapshot.hasData){
                      //final data = snapshot.data;
                      return MoviesSlider(snapshot: snapshot,);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



