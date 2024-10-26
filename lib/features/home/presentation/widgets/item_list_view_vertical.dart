import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/widgets/vertical_showing.dart';

class ItemListViewVertical extends StatelessWidget {
  const ItemListViewVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 15,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const VerticalShowingWidget();
      },
    );
  }
}
