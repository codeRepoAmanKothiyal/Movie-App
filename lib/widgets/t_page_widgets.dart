import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/details_screen.dart';

class TrendingMoviesPage extends StatelessWidget {
  const TrendingMoviesPage({super.key,
    required this.snapshot
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int rowIndex = 0; rowIndex < (snapshot.data!.length / 2).ceil(); rowIndex++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = rowIndex * 2; i < (rowIndex * 2 + 2); i++)
                if (i < snapshot.data!.length)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              movies: snapshot.data[i],
                            ),
                          ),
                        );
                      },
                      child: Column(

                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              height: 250,
                              width: 200,
                              child: Image.network(
                                "${Constants.imagePath}${snapshot.data[i].posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            snapshot.data[i].title,
                            style: TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
            ],
          ),
      ],
    );
  }
}
