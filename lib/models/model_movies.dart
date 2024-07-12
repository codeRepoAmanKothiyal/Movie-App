/*
{
"page": 1,
"results": [
{
"adult": false,
"backdrop_path": "/kHlX3oqdD4VGaLpB8O78M25KfdS.jpg",
"id": 945729,
"title": "A Haunting in Venice",
"original_language": "en",
"original_title": "A Haunting in Venice",
"overview": "Celebrated sleuth Hercule Poirot,
"poster_path": "/1Xgjl22MkAZQUavvOeBqRehrvqO.jpg",
"media_type": "movie",
"genre_ids": [
9648,
53,
80
],
"popularity": 418.706,
"release_date": "2023-09-13",
"video": false,
"vote_average": 6.815,
"vote_count": 748
},
 */

class Movies {
String title ;
String backDropPath ;
String originalTitle ;
String overview ;
String posterPath ;
String releaseDate;
double voteAverage ;

Movies({
  required this.title,
  required this.backDropPath,
  required this.originalTitle,
  required this.overview,
  required this.posterPath,
  required this.releaseDate,
  required this.voteAverage,
});

factory Movies.fromJson(Map<String, dynamic> json){
  return Movies(
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
  );
}
}
