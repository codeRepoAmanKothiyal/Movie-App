import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../screens/details_screen.dart';

class TrendingMoviesWidget extends StatelessWidget {
  const TrendingMoviesWidget({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     for (int rowIndex = 0; rowIndex <
    //         (snapshot.data!.length / 2).ceil(); rowIndex++)
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           for (int i = rowIndex * 2; i < (rowIndex * 2 + 2); i++)
    //             if (i < snapshot.data!.length)
    //               Expanded(
    //                 child: GestureDetector(
    //                   onTap: () {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) =>
    //                             DetailsScreen(
    //                               movies: snapshot.data[i],
    //                             ),
    //                       ),
    //                     );
    //                   },
    //                   child: Container(
    //                     width: MediaQuery.of(context).size.width/2,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         ClipRRect(
    //                           borderRadius: BorderRadius.circular(12.0),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.end,
    //                             children: [
    //                               Image.network(
    //                                 "${Constants.imagePath}${snapshot.data[i]
    //                                     .posterPath}",
    //                                 fit: BoxFit.cover,
    //                                 height: 250,
    //                               ),
    //                               SizedBox(height: 15,),
    //                               Text(
    //                                 snapshot.data[i].title,
    //                               ),
    //
    //                               Row(
    //                                 children: [
    //                                   RatingBar.builder(
    //                                     initialRating: 5,
    //                                     minRating: 1,
    //                                     direction: Axis.horizontal,
    //                                     allowHalfRating: true,
    //                                     itemSize: 20,
    //                                     itemCount: 5,
    //                                     itemPadding: EdgeInsets.symmetric(
    //                                         horizontal: 4.0),
    //                                     itemBuilder: (context, _) =>
    //                                         Icon(
    //                                           Icons.star,
    //                                           color: Colors.amber,
    //                                         ),
    //                                     onRatingUpdate: (rating) {
    //                                       print(rating);
    //                                     },
    //                                   ),
    //                                   Align(
    //                                     alignment: Alignment.centerRight,
    //                                     child: Text(
    //                                       snapshot.data[i].voteAverage.toString(),
    //
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //
    //                               Align(
    //                                 alignment: Alignment.centerRight,
    //                                 child: Text(snapshot.data[i].releaseDate,
    //                                 ),
    //                               ),
    //
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //         ],
    //       ),
    //   ],
    // );

    return
     SingleChildScrollView(
       physics: ScrollPhysics(),
       child: GridView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Image.network("${Constants.imagePath}${snapshot.data[index].posterPath}")
                ],
              ),
            );
          },
        ),
     );
  }
}
