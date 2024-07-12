import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavorateMovies extends StatefulWidget {
  const FavorateMovies({super.key});

  @override
  State<FavorateMovies> createState() => _FavorateMoviesState();
}

class _FavorateMoviesState extends State<FavorateMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "THIS IS FAVORATE MOVIES PAGE",
          style: GoogleFonts.belleza(
            color: Colors.deepOrange,
            fontWeight: FontWeight.w700,
            fontSize: 25
          ),
        ),
      ),
    );
  }
}
