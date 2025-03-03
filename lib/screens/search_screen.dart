import 'package:flutter/material.dart';
import 'package:pilem1/models/movie.dart';
import 'package:pilem1/services/api_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchMovie);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchMovie() async {
    if (_searchController.text.isEmpty) {
      setState(() {
        _searchResult.clear();
      });
      return;
    }
    final List<Map<String, dynamic>> searchData =
        await _apiService.getAllMovie();

    setState(() {
      _searchResult = searchData.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
