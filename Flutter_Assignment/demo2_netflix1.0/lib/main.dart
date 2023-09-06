// import 'package:demo_space_exploration/loggedin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Disney+',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});
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
          title: const Text('Disney minus'),
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
            Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Container(
                        height: 200,
                        width: 205,
                        decoration: const BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://www.vintagemovieposters.co.uk/wp-content/uploads/2018/12/IMG_3266.jpeg',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 205,
                        decoration: const BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://i.insider.com/54ee12f86bb3f74155fb10ec?width=750&format=jpeg&auto=webp',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 205,
                        decoration: const BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://www.vintagemovieposters.co.uk/wp-content/uploads/2021/12/IMG_4503-scaled.jpeg',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 205,
                        decoration: const BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://www.vintagemovieposters.co.uk/wp-content/uploads/2019/10/IMG_1864.jpeg',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 205,
                        decoration: const BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2022/07/Avengers-Infinity-War-2018.jpeg?w=720',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 205,
                        decoration: const BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://i.insider.com/5ca3ba3792c88606ce34b614?width=750&format=jpeg&auto=webp',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ]))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                    child: const Center(
                      child: Text('Movie Name'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
//
// class Movie {
//   const Movie({
//     required this.name,
//     required this.hero,
//     required this.imageUrl,
//   });
//
//   String name;
//   String hero;
//   String imageUrl;
// }
//
// const locations = [
//   Movie(
//     name: 'Mount Rushmore',
//     hero: 'U.S.A',
//     imageUrl: '/01-mount-rushmore.jpg',
//   ),
//   Movie(
//     name: 'Gardens By The Bay',
//     hero: 'Singapore',
//     imageUrl: '/02-singapore.jpg',
//   ),
// ];
