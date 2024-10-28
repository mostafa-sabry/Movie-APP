part of 'get_everything_cubit.dart';

abstract class GetEverythingState {}

final class GetEverythingInitial extends GetEverythingState {}

final class GetEverythingLoading extends GetEverythingState {}

final class GetEverythingSuccess extends GetEverythingState {
  final List<GetEverythingModel> getEverythingList;
  GetEverythingSuccess(this.getEverythingList);
}

final class GetEverythingError extends GetEverythingState {
  final String errorMessage;
  GetEverythingError(this.errorMessage);
} 
