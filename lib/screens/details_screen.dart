import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_flix_app/models/model_movies.dart';

import '../constants.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key,
    required this.movies});

  final Movies movies;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(top: 16, left: 16,),
              decoration: BoxDecoration(
                  color:Colors.black12,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                    Icons.arrow_back
                ),
              ),
            ),
            backgroundColor: Colors.black12,
            expandedHeight: 380,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.movies.title ,
                style: GoogleFonts.belleza(
                    fontSize:17.0,
                    fontWeight: FontWeight.w600 ),),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200)
                ) ,
                child: Image.network(
                    '${Constants.imagePath}${widget.movies.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.movies.title,
                    style: GoogleFonts.belleza(
                        fontSize:40.0,
                        fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox( height: 16,),
                  SizedBox(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                          child: Row(
                            children: [
                              Text("Release: ${widget.movies.releaseDate}",
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,
                                width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text("Rating : ",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white
                                ),
                              ),
                              Icon(
                                  Icons.star,
                                color: Colors.amber,
                              ),
                              Text("${widget.movies.voteAverage.toStringAsFixed(1)}/10)",
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox( height: 16,),
                 Text("Overview",
                   style: GoogleFonts.openSans(
                       fontWeight: FontWeight.w800,
                     fontSize: 30,
                     color: Colors.white
                   ),
                 ),
                 Text(widget.movies.overview,
                style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),
                 )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
