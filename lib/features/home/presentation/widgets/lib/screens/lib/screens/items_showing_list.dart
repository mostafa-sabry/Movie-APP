import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/features/home/data/models/lib/models/get_everything_model.dart';
import 'package:movie/features/home/presentation/widgets/lib/screens/lib/screens/movie_detailed_screen.dart.dart';

class ItemShowingList extends StatelessWidget {
  const ItemShowingList({
    Key? key,
    required this.results,
  }) : super(key: key);

  final GetEverythingModel results;

  @override
  Widget build(BuildContext context) {
    const String baseImageUrl = 'https://image.tmdb.org/t/p/w400';
    return InkWell(
      onTap: () {
        if (results.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(results: results), // Pass the whole model
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Movie ID is missing.")),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '$baseImageUrl${results.posterPath}',
              height: 200,
              width: 143,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 100,
              child: Text(
                results.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/star.svg'),
                Text(
                  '${results.voteAverage}/10 IMDb',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}