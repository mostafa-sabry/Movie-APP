import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/api_services/api/api_consumer.dart';
import 'package:movie/features/home/data/models/get_everything_model.dart';

import '../../../../core/api_services/api/end_points.dart';

class GetEverythingRepo {
  final ApiConsumer api;

  GetEverythingRepo({required this.api});

  Future<Either<String, List<GetEverythingModel>>> getEverythingRepo() async {
    try {
      final response = await api.get("$baseUrl/now_playing?api_key=$apiKey");
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> result = jsonData['results'];

      List<GetEverythingModel> getEverythingList = [];

      for (var article in result) {
        GetEverythingModel getEverythingModel =
            GetEverythingModel.fromJson(article);
        getEverythingList.add(getEverythingModel);
      }

      return Right(getEverythingList);
    } on DioException catch (e) {
      return Left("Failed to fetch data: ${e.message}");
    }catch (e) {
      return Left("An unexpected error occurred: ${e.toString()}");
    }
  }
}
