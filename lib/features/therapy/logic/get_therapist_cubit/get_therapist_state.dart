import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/core/networking/api_error_model.dart';
import 'package:insighta/features/therapy/data/models/therapy_response.dart';
part 'get_therapist_state.freezed.dart';

@freezed
class GetTherapistState with _$GetTherapistState {
  const factory GetTherapistState.initial() = _Initial;
  const factory GetTherapistState.loading() = Loading;
  const factory GetTherapistState.success(
      {required TherapyResponse therapyResponse}) = Success;
  const factory GetTherapistState.error({required ApiErrorModel error}) = Error;
}
