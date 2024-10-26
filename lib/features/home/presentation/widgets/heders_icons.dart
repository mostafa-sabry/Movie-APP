import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/custom_text_style.dart';

class HeaderIcons extends StatelessWidget {
  const HeaderIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/union.svg',
            height: 22,
            width: 22,
          ),
        ),
        Text(
          'FilmKu',
          style: CustomTextStyles.text16Black,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/notif.svg',
            height: 35,
            width: 35,
          ),
        ),
      ],
    );
  }
}
