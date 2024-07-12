import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_flix_app/constants.dart';
import 'package:movie_flix_app/screens/details_screen.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: snapshot.data!.length,
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            enlargeCenterPage: true,
            // pageSnapping: true,
            viewportFraction: 0.55,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                    MaterialPageRoute(
                        builder: (context) =>  DetailsScreen(
                    movies: snapshot.data[itemIndex],
                        ),
                ),
                );
              },
              child: ClipRRect( // clips its child using a rounded rectangle.
                borderRadius: BorderRadius.circular(12.0),
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    "${Constants.imagePath}${snapshot.data[itemIndex].posterPath}"
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}