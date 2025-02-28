import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ApiService _apiService = ApiService(); // Service API
  final TextEditingController _searchController =
      TextEditingController(); // Input pencarian
  List<Movie> _searchResults = []; // Hasil pencarian

  void _searchMovies() async {
    String query = _searchController.text.trim();
    if (query.isNotEmpty) {
      List<Movie> results = await _apiService.searchMovies(query);
      setState(() {
        _searchResults = results;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose(); // Membersihkan controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')), // Title AppBar
      body: Column(
        children: [
          // Bagian atas: Row dengan TextField dan IconButton
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for a movie...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onSubmitted: (_) => _searchMovies(), // Enter untuk mencari
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchMovies, // Tombol search
                ),
              ],
            ),
          ),

          // Bagian bawah: ListView hasil pencarian
          Expanded(
            child: _searchResults.isEmpty
                ? const Center(child: Text('No results found.'))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final movie = _searchResults[index];
                      return ListTile(
                        leading: Image.network(
                          'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(movie.title),
                        subtitle: Text('Rating: ${movie.rating}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
