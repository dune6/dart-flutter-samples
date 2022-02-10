import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String date;
  final String description;

  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.date,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: Images.dune,
      title: 'Basketball',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      id: 2,
      imageName: Images.dune,
      title: 'Interception',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      id: 3,
      imageName: Images.dune,
      title: 'Equilibrium',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      id: 4,
      imageName: Images.dune,
      title: 'Social network',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      id: 5,
      imageName: Images.dune,
      title: 'Big jackpot',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      id: 6,
      imageName: Images.dune,
      title: 'Gents',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
    Movie(
      id: 7,
      imageName: Images.dune,
      title: 'Lighthouse',
      date: 'April 22, 2003',
      description:
          'This film about something... This film about something... This film about something... This film about something...',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies
          .where((Movie movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed('/main_screen/movie_details_widget', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.only(top: 70),
        itemCount: _filteredMovies.length,
        itemExtent: 200,
        itemBuilder: (BuildContext context, int index) {
          final movie = _filteredMovies[index];
          return Padding(
            padding:
                const EdgeInsets.only(right: 20, top: 10, left: 20, bottom: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Image(image: AssetImage(movie.imageName)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  movie.date,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  movie.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () => _onMovieTap(index),
                  ),
                )
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Поиск',
            filled: true,
            fillColor: Colors.white.withAlpha(235),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    ]);
  }
}
