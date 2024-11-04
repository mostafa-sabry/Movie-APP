import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/core/networking/api/dio_consumer.dart';
import 'package:movie/core/networking/fire_base_helpers/firebase_helper.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<FirebaseHelper>(FirebaseHelper());
}
