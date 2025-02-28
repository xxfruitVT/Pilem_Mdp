import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(movie.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Release Date: ${movie.releaseDate ?? 'Unknown'}',
                style: TextStyle(fontSize: 16)), // Perbaiki error
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 5),
                Text('${movie.voteAverage}', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Text('Overview:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(movie.overview, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
