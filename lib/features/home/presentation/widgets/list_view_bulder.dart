import 'package:flutter/material.dart';

import 'items_showing_list.dart';

class ShowingListViewWidget extends StatelessWidget {
  const ShowingListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const ItemSowhingList();
        },
      ),
    );
  }
}
