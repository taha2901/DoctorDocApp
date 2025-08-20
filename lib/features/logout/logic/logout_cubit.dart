// import 'package:doc/features/logout/data/logout_repo.dart';
// import 'package:doc/features/logout/logic/logout_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LogoutCubit extends Cubit<LogoutState> {
//   final LogoutRepo _logoutRepo;

//   LogoutCubit(this._logoutRepo) : super(const LogoutState.initial());


//   Future<void> logout() async {
//     emit(const LogoutState.logoutLoading());
//     final response = await _logoutRepo.logout();
    
//     response.when(
//       success: (logoutResponse) {
//         // Clear local data
//         // profileResponseModel = null;
//         emit(const LogoutState.logoutSuccess());
//       },
//       failure: (errorHandler) {
//         emit(LogoutState.logoutError(errorHandler.apiErrorModel));
//       },
//     );
//   }
// }
