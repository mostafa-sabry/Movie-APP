import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../../core/utils/custom_text_style.dart';
import '../../../../../../data/models/lib/models/get_everything_model.dart';

class VerticalShowingWidget extends StatelessWidget {
  const VerticalShowingWidget({
    super.key,
    required this.results,
  });

  final GetEverythingModel results;

  @override
  Widget build(BuildContext context) {
    const String baseImageUrl = 'https://image.tmdb.org/t/p/w400';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        children: [
          // Movie Poster Image
          Image.network(
            '$baseImageUrl${results.posterPath}',
            height: 150,
            width: 90,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.broken_image,
              size: 90,
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                height: 150,
                width: 90,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          
          // Spacing between Image and Text Content
          const SizedBox(width: 10),
          
          // Movie Details (Title and Rating)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vertical spacing
                verticalSpace(10),

                // Movie Title with overflow handling
                Text(
                  results.title ?? '',
                  style: CustomTextStyles.subtitle14dark,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                // Vertical spacing between title and rating
                verticalSpace(5),

                // Rating Row
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/star.svg',
                      width: 16,
                      height: 16,
                    ),
                    horizontalSpace(5),
                    Text(
                      '${results.voteAverage}/10 IMDb',
                      style: CustomTextStyles.subtitle12gery,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
