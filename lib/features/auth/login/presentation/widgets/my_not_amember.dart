import 'package:flutter/material.dart';
import 'package:movie/core/utils/custom_text_style.dart';

class MyNotAMember extends StatelessWidget {
  const MyNotAMember({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not A Member ?',
          style: CustomTextStyles.font14Dark,
        ),
        TextButton(
          onPressed: () {
            // Navigator.pushNamed(context, Routes.register);
          },
          child: Text(
            "Register Now",
            style: CustomTextStyles.font14Blue,
          ),
        )
      ],
    );
  }
}
