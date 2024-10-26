import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/custom_text_style.dart';

class ItemSowhingList extends StatelessWidget {
  const ItemSowhingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/poster.png'),
              verticalSpace(10),
              Text(
                'Spiderman',
                style: CustomTextStyles.subtitle14dark,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/images/star.svg'),
                  Text(
                    '9.1/10 IMDb',
                    style: CustomTextStyles.subtitle12gery,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
