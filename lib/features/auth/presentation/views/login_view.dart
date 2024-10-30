import 'package:flutter/material.dart';
import 'package:movie/core/helpers/spacing.dart';
import 'package:movie/core/utils/custom_text_style.dart';

import '../../../../core/widgets/my_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(150),
                Text(
                  'Welcome Back !',
                  style: CustomTextStyles.font28SemiBoldWith,
                ),
                verticalSpace(35),
                Text('Email', style: CustomTextStyles.font18SemiBoldWith),
                verticalSpace(10),
                const MyTextFormField(
                  hintText: 'Enter Email',
                  isObscure: false,
                ),
                verticalSpace(20),
                Text('Password', style: CustomTextStyles.font18SemiBoldWith),
                verticalSpace(10),
                MyTextFormField(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                     
                    },
                    icon: const Icon(
                      Icons.visibility,
                     ),
                  ),
                  isObscure: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
