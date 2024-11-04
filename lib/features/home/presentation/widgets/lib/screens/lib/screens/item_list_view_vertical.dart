import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie/core/utils/my_colors.dart';
import 'package:movie/features/home/data/models/lib/models/get_everything_model.dart';
import 'package:movie/features/home/presentation/cubit_everything/cubit/popular_cubit.dart';
import 'package:movie/features/home/presentation/widgets/lib/screens/lib/screens/vertical_showing.dart';

class ItemListViewVertical extends StatelessWidget {
  const ItemListViewVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoading) {
          return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: MyColors.secondary, size: 60));
        } else if (state is PopularError) {
          return Center(
            child: Text("Failed to load data: ${state.errorMessage}"),
          );
        } else if (state is PopularSuccess) {
          final List<GetEverythingModel> results = state.model.results;

          if (results.isEmpty) {
            return const Center(child: Text("No results found"));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(), // Limit scrolling physics
              shrinkWrap: true, // Wrap to avoid unnecessary space
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Add spacing between items
                  child: VerticalShowingWidget(results: results[index]),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text("No results found"));
        }
      },
    );
  }
}
