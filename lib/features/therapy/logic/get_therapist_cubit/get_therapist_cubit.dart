import 'package:bloc/bloc.dart';


import 'package:insighta/features/therapy/data/repos/therapy_repo.dart';
import 'package:insighta/features/therapy/logic/get_therapist_cubit/get_therapist_state.dart';

class GetTherapistCubit extends Cubit<GetTherapistState> {
  final TherapyRepo _therapyRepo;
  GetTherapistCubit(this._therapyRepo) : super(GetTherapistState.initial());
  void getTherapist() async {
    emit(const GetTherapistState.loading());
    final response = await _therapyRepo.getTherapist();
    response.when(success: (therapyResponse) {
      emit(GetTherapistState.success(therapyResponse: therapyResponse));
    }, failure: (error) {
      emit(GetTherapistState.error(error: error));
    });
  }
}
