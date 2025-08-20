import 'package:doc/features/profile/data/model/profile_response_model/profile_response_model.dart';
import 'package:doc/features/profile/data/model/update_profile_request_body.dart';
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
    final response = await _profileRepo.getProfileData();
    if (isClosed) return;
    response.when(
      success: (data) {
        if (isClosed) return;
        profileResponseModel = data;
        emit(ProfileState.success(data));
      },
      failure: (errorHandler) {
        if (isClosed) return;
        emit(ProfileState.error(errorHandler.apiErrorModel));
      },
    );
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
      passwordConfirmation: password, // Usually same as password
    );

    final response = await _profileRepo.updateProfile(updateProfileRequestBody);
    if (isClosed) return;
    response.when(
      success: (updateResponse) {
        // Update the local profile data after successful update
        if (profileResponseModel?.data != null &&
            profileResponseModel!.data!.isNotEmpty) {
          profileResponseModel!.data!.first.name = name;
          profileResponseModel!.data!.first.email = email;
          profileResponseModel!.data!.first.phone = phone;
        }
        if (isClosed) return;
        emit(const ProfileState.updateProfileSuccess());
      },
      failure: (errorHandler) {
        if (isClosed) return;
        emit(ProfileState.updateProfileError(errorHandler.apiErrorModel));
      },
    );
  }

  // ✅ إضافة logout method
  Future<void> logout() async {
    emit(const ProfileState.logoutLoading());
    final response = await _profileRepo.logout();
    if (isClosed) return;
    response.when(
      success: (logoutResponse) {
        // Clear local data
        if (isClosed) return;
        profileResponseModel = null;
        emit(const ProfileState.logoutSuccess());
      },
      failure: (errorHandler) {
        if (isClosed) return;
        emit(ProfileState.logoutError(errorHandler.apiErrorModel));
      },
    );
  }
}
