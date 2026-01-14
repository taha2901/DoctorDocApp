// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'api_error_handler.dart';

// part 'api_result.freezed.dart';

// @freezed
// class ApiResult<T> with _$ApiResult<T> {
//   const ApiResult._();

//   const factory ApiResult.success(T data) = Success<T>;
//   const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
// }



import 'api_error_handler.dart';

abstract class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final ErrorHandler errorHandler;
  const ApiFailure(this.errorHandler);
}
