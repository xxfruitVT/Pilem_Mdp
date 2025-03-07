import 'package:flutter/material.dart';
import 'package:pilem1/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Movie> _favouriteMovies = [];

  Future<void> _loadFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favoriteMovieIds =
        prefs.getKeys().where((key) => key.startsWith('movie_')).toList();
    setState(() {
      _favouriteMovies = favoriteMovieIds
    });
  }

  @override
  void initState() {
    _loadFavoriteMovies();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
