import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Disney+',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatefulWidget {
  const TutorialHome({super.key});
  HomePage createState() => HomePage();
}

class HomePage extends State<TutorialHome> {
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Bar',
            onPressed: null,
          ),
          title: const Text('Disney Minus Ultra Pro Max'),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        // body is the majority of the screen.
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Movie data = movieList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        ind = index;
                      });
                    },
                    child: MovieCard(
                      movie: data,
                    ),
                  );
                },
                itemCount: movieList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 500,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.lightGreen[500],
                  ),
                  child: Center(
                    child: Text(
                      'Movie Name: ${movieList[ind].name}',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class MovieCard extends StatefulWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScreenState();
  }
}

class _ScreenState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                widget.movie.image,
              ),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 170.0),
          child: Text(
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black,
                backgroundColor: Colors.white,
                fontSize: 20),
            widget.movie.name,
          ),
        ));
  }
}

class Movie {
  const Movie({
    required this.name,
    required this.image,
  });

  final String name;

  final String image;
}

const movieList = [
  Movie(
    name: 'Cap Amrika',
    image:
        'https://www.vintagemovieposters.co.uk/wp-content/uploads/2018/12/IMG_3266.jpeg',
  ),
  Movie(
    name: 'Age of Ultron',
    image:
        'https://i.insider.com/54ee12f86bb3f74155fb10ec?width=750&format=jpeg&auto=webp',
  ),
  Movie(
    name: 'Civil war',
    image:
        'https://www.vintagemovieposters.co.uk/wp-content/uploads/2021/12/IMG_4503-scaled.jpeg',
  ),
  Movie(
    name: 'Ragnarok',
    image:
        'https://www.vintagemovieposters.co.uk/wp-content/uploads/2019/10/IMG_1864.jpeg',
  ),
  Movie(
    name: 'Infinity war',
    image:
        'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2022/07/Avengers-Infinity-War-2018.jpeg?w=720',
  ),
  Movie(
    name: 'Endgame',
    image:
        'https://i.insider.com/5ca3ba3792c88606ce34b614?width=750&format=jpeg&auto=webp',
  ),
];
