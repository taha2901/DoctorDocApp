import 'package:doc/core/networking/api_error_model.dart';
import 'package:doc/features/profile/data/model/profile_response_model/profile_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = ProfileLoading;
  factory ProfileState.success(ProfileResponseModel model) = ProfileSuccess;
  const factory ProfileState.error(ApiErrorModel apiErrorModel) = ProfileError;

  const factory ProfileState.updateProfileLoading() = UpdateProfileLoading;

  const factory ProfileState.updateProfileSuccess() = UpdateProfileSuccess;

  const factory ProfileState.updateProfileError(ApiErrorModel apiErrorModel) =
      UpdateProfileError;

// ✅ إضافة logout states
  const factory ProfileState.logoutLoading() = LogoutLoading;
  const factory ProfileState.logoutSuccess() = LogoutSuccess;
  const factory ProfileState.logoutError(ApiErrorModel apiErrorModel) =
      LogoutError;
}
