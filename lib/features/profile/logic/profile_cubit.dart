import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/features/logout/data/logout_response.dart';
import 'package:doc/features/profile/data/model/profile_response_model/profile_response_model.dart';
import 'package:doc/features/profile/data/model/update_profile_request_body.dart';
import 'package:doc/features/profile/data/model/update_profile_response_body/update_profile_response_body.dart';
import 'package:doc/features/profile/data/repo/profile_repo.dart';
import 'package:doc/features/profile/logic/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileResponseModel? profileResponseModel;

  Future<void> getProfileData() async {
    emit(const ProfileState.loading());

    final ApiResult<ProfileResponseModel> result =
        await _profileRepo.getProfileData();
    if (isClosed) return;

    if (result is ApiSuccess<ProfileResponseModel>) {
      final success = result;
      profileResponseModel = success.data;
      emit(ProfileState.success(success.data));
      return;
    }

    if (result is ApiFailure<ProfileResponseModel>) {
      final failure = result;
      emit(ProfileState.error(failure.errorHandler.apiErrorModel));
      return;
    }

    emit(ProfileState.error(
      ErrorHandler.handle("Unexpected error").apiErrorModel,
    ));
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(const ProfileState.updateProfileLoading());

    final updateProfileRequestBody = UpdateProfileRequestBody(
      name: name,
      email: email,
      phone: phone,
      password: password,
      passwordConfirmation: password,
    );

    final ApiResult<UpdateProfileResponseBody> result =
        await _profileRepo.updateProfile(updateProfileRequestBody);

    if (isClosed) return;

    if (result is ApiSuccess<UpdateProfileResponseBody>) {
      // Update local profile cache
      if (profileResponseModel?.data != null &&
          profileResponseModel!.data!.isNotEmpty) {
        profileResponseModel!.data!.first.name = name;
        profileResponseModel!.data!.first.email = email;
        profileResponseModel!.data!.first.phone = phone;
      }

      emit(const ProfileState.updateProfileSuccess());
      return;
    }

    if (result is ApiFailure<UpdateProfileResponseBody>) {
      final failure = result;
      emit(ProfileState.updateProfileError(failure.errorHandler.apiErrorModel));
      return;
    }

    emit(ProfileState.updateProfileError(
      ErrorHandler.handle("Unexpected error").apiErrorModel,
    ));
  }

  Future<void> logout() async {
    emit(const ProfileState.logoutLoading());

    final ApiResult<LogoutResponseBody> result = await _profileRepo.logout();
    if (isClosed) return;

    if (result is ApiSuccess<LogoutResponseBody>) {
      profileResponseModel = null;
      emit(const ProfileState.logoutSuccess());
      return;
    }

    if (result is ApiFailure<LogoutResponseBody>) {
      final failure = result;
      emit(ProfileState.logoutError(failure.errorHandler.apiErrorModel));
      return;
    }

    emit(ProfileState.logoutError(
      ErrorHandler.handle("Unexpected error").apiErrorModel,
    ));
  }
}
