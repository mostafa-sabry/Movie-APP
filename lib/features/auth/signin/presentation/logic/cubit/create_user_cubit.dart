import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/networking/fire_base_helpers/firebase_helper.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.firebaseHelper) : super(CreateUserInitial());

  final FirebaseHelper firebaseHelper;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> createUser() async {
    emit(CreateUserLoading());
    if (formKey.currentState!.validate()) {
      try {
        await firebaseHelper.registerUser(
          emailController.text,
          passwordController.text,
        );

        await firebaseHelper.createUser(
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text,
          image: '',
        );

        emit(CreateUserSuccess());
      } catch (e) {
        emit(CreateUserError());
      }
    } else {
      emit(CreateUserError());
    }
  }
}
