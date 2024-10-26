import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/custom_text_style.dart';

class VerticalShowingWidget extends StatelessWidget {
  const VerticalShowingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Image.asset('assets/images/poster1.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            Text(
              'Venom Let There\nBe Carnage',
              style: CustomTextStyles.subtitle14dark,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/star.svg'),
                horizontalSpace(5),
                Text(
                  '6.4/10 IMDb',
                  style: CustomTextStyles.subtitle12gery,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
