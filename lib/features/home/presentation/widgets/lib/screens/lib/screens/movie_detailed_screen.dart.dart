import 'package:flutter/material.dart';
import 'package:movie/features/home/data/models/lib/models/get_everything_model.dart';


class MovieDetailScreen extends StatelessWidget {
  final GetEverythingModel results;

  const MovieDetailScreen({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

    return Scaffold(
      appBar: AppBar(
        title: Text(results.title ?? 'Movie Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              '$baseImageUrl${results.backdropPath}',
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.broken_image, size: 100)),
                );
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results.title ?? '',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Release Date: ${results.releaseDate?.substring(0, 10) ?? ''}', // Adjust as necessary
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Overview: ${results.overview ?? 'No overview available.'}',
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  // Add additional details here as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
