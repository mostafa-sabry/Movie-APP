import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/models/get_everything_model.dart';

import '../../../data/repo/get_everything_repo.dart';

part 'get_everything_state.dart';

class GetEverythingCubit extends Cubit<GetEverythingState> {
  GetEverythingCubit(this.getEverythingRepo) : super(GetEverythingInitial());

  final GetEverythingRepo getEverythingRepo;

  getEverything() async {
    emit(GetEverythingLoading());

    final result = await getEverythingRepo.getEverythingRepo();

    result.fold(
      (l) => emit(GetEverythingError(l)),
      (r) => emit(GetEverythingSuccess(r)));
  }
}
