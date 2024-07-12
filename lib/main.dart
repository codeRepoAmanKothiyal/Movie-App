import 'package:flutter/material.dart';
import 'package:movie_flix_app/screens/favorate.dart';
import 'package:movie_flix_app/screens/home.dart';
import 'package:movie_flix_app/screens/trending.dart';
import 'package:movie_flix_app/screens_two/favorate2.dart';
import 'package:movie_flix_app/screens_two/trending2.dart';
import 'package:movie_flix_app/screens_two/upcoming.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Weather App",
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black12,
      colorScheme: ColorScheme.light(
        primary: Colors.white,

      )
    ),
    home: PageStructure(),
  ));
}



class PageStructure extends StatefulWidget {
  const PageStructure({Key? key}) : super(key: key);

  @override
  State<PageStructure> createState() => _PageStructureState();
}

class _PageStructureState extends State<PageStructure> {
  var _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Movieflix",
          style: TextStyle(
            fontSize: 40,
            color: Colors.deepOrange
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body:_selectedTab == 1
          ? HomeScreen()
          : _selectedTab == 0
          ? FavorateMovies()
          : Trending(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
                color: Colors.grey
            ),
            label: "Favorate",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: Colors.grey
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department_sharp,
              color: Colors.grey,),
            label: "Trending",
          ),
        ],
      ),
    );
  }
}




class PageStructure2 extends StatefulWidget {
  const PageStructure2({Key? key}) : super(key: key);

  @override
  State<PageStructure2> createState() => _PageStructure2State();
}

class _PageStructure2State extends State<PageStructure2> {
  var _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:
      //   Text("MovieApp",
      //     style: TextStyle(
      //         fontSize: 40,
      //         color: Colors.deepOrange
      //     ),
      //   ),
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      // ),
      body:_selectedTab == 1
          ? TrendingMovies2()
          : _selectedTab == 0
          ? FavorateMovies2()
          : UpcomingMovies2(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
                color: Colors.grey
            ),
            label: "Favorate",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department_sharp,
                color: Colors.grey
            ),
            label: "Trending",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star,
              color: Colors.grey,),
            label: "Upcoming",
          ),
        ],
      ),
    );
  }
}
