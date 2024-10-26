import 'package:flutter/material.dart';
import 'package:movie/core/helpers/spacing.dart';
import 'package:movie/core/utils/custom_text_style.dart';
import 'package:movie/core/utils/my_colors.dart';
import 'package:movie/features/home/presentation/widgets/item_list_view_vertical.dart';
import 'package:movie/features/home/presentation/widgets/list_view_bulder.dart';

import 'heders_icons.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: const [0.6, 0.5],
          colors: [
            MyColors.primary,
            MyColors.bg.withOpacity(0.2),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderIcons(),
          verticalSpace(24),
          Text(
            'Now Showing',
            style: CustomTextStyles.text20Black,
          ),
          verticalSpace(10),
          const ShowingListViewWidget(),
          verticalSpace(16),
          Text(
            'Popular',
            style: CustomTextStyles.text20Black,
          ),
          const Expanded(child: ItemListViewVertical()),
        ],
      ),
    );
  }
}
