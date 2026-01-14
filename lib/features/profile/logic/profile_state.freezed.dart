// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState()';
  }
}

/// @nodoc
class $ProfileStateCopyWith<$Res> {
  $ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}

/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ProfileLoading value)? loading,
    TResult Function(ProfileSuccess value)? success,
    TResult Function(ProfileError value)? error,
    TResult Function(UpdateProfileLoading value)? updateProfileLoading,
    TResult Function(UpdateProfileSuccess value)? updateProfileSuccess,
    TResult Function(UpdateProfileError value)? updateProfileError,
    TResult Function(LogoutLoading value)? logoutLoading,
    TResult Function(LogoutSuccess value)? logoutSuccess,
    TResult Function(LogoutError value)? logoutError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case ProfileLoading() when loading != null:
        return loading(_that);
      case ProfileSuccess() when success != null:
        return success(_that);
      case ProfileError() when error != null:
        return error(_that);
      case UpdateProfileLoading() when updateProfileLoading != null:
        return updateProfileLoading(_that);
      case UpdateProfileSuccess() when updateProfileSuccess != null:
        return updateProfileSuccess(_that);
      case UpdateProfileError() when updateProfileError != null:
        return updateProfileError(_that);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading(_that);
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess(_that);
      case LogoutError() when logoutError != null:
        return logoutError(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ProfileLoading value) loading,
    required TResult Function(ProfileSuccess value) success,
    required TResult Function(ProfileError value) error,
    required TResult Function(UpdateProfileLoading value) updateProfileLoading,
    required TResult Function(UpdateProfileSuccess value) updateProfileSuccess,
    required TResult Function(UpdateProfileError value) updateProfileError,
    required TResult Function(LogoutLoading value) logoutLoading,
    required TResult Function(LogoutSuccess value) logoutSuccess,
    required TResult Function(LogoutError value) logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case ProfileLoading():
        return loading(_that);
      case ProfileSuccess():
        return success(_that);
      case ProfileError():
        return error(_that);
      case UpdateProfileLoading():
        return updateProfileLoading(_that);
      case UpdateProfileSuccess():
        return updateProfileSuccess(_that);
      case UpdateProfileError():
        return updateProfileError(_that);
      case LogoutLoading():
        return logoutLoading(_that);
      case LogoutSuccess():
        return logoutSuccess(_that);
      case LogoutError():
        return logoutError(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ProfileLoading value)? loading,
    TResult? Function(ProfileSuccess value)? success,
    TResult? Function(ProfileError value)? error,
    TResult? Function(UpdateProfileLoading value)? updateProfileLoading,
    TResult? Function(UpdateProfileSuccess value)? updateProfileSuccess,
    TResult? Function(UpdateProfileError value)? updateProfileError,
    TResult? Function(LogoutLoading value)? logoutLoading,
    TResult? Function(LogoutSuccess value)? logoutSuccess,
    TResult? Function(LogoutError value)? logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case ProfileLoading() when loading != null:
        return loading(_that);
      case ProfileSuccess() when success != null:
        return success(_that);
      case ProfileError() when error != null:
        return error(_that);
      case UpdateProfileLoading() when updateProfileLoading != null:
        return updateProfileLoading(_that);
      case UpdateProfileSuccess() when updateProfileSuccess != null:
        return updateProfileSuccess(_that);
      case UpdateProfileError() when updateProfileError != null:
        return updateProfileError(_that);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading(_that);
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess(_that);
      case LogoutError() when logoutError != null:
        return logoutError(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProfileResponseModel model)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? updateProfileLoading,
    TResult Function()? updateProfileSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? updateProfileError,
    TResult Function()? logoutLoading,
    TResult Function()? logoutSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? logoutError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case ProfileLoading() when loading != null:
        return loading();
      case ProfileSuccess() when success != null:
        return success(_that.model);
      case ProfileError() when error != null:
        return error(_that.apiErrorModel);
      case UpdateProfileLoading() when updateProfileLoading != null:
        return updateProfileLoading();
      case UpdateProfileSuccess() when updateProfileSuccess != null:
        return updateProfileSuccess();
      case UpdateProfileError() when updateProfileError != null:
        return updateProfileError(_that.apiErrorModel);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading();
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess();
      case LogoutError() when logoutError != null:
        return logoutError(_that.apiErrorModel);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProfileResponseModel model) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() updateProfileLoading,
    required TResult Function() updateProfileSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) updateProfileError,
    required TResult Function() logoutLoading,
    required TResult Function() logoutSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case ProfileLoading():
        return loading();
      case ProfileSuccess():
        return success(_that.model);
      case ProfileError():
        return error(_that.apiErrorModel);
      case UpdateProfileLoading():
        return updateProfileLoading();
      case UpdateProfileSuccess():
        return updateProfileSuccess();
      case UpdateProfileError():
        return updateProfileError(_that.apiErrorModel);
      case LogoutLoading():
        return logoutLoading();
      case LogoutSuccess():
        return logoutSuccess();
      case LogoutError():
        return logoutError(_that.apiErrorModel);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProfileResponseModel model)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? updateProfileLoading,
    TResult? Function()? updateProfileSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? updateProfileError,
    TResult? Function()? logoutLoading,
    TResult? Function()? logoutSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case ProfileLoading() when loading != null:
        return loading();
      case ProfileSuccess() when success != null:
        return success(_that.model);
      case ProfileError() when error != null:
        return error(_that.apiErrorModel);
      case UpdateProfileLoading() when updateProfileLoading != null:
        return updateProfileLoading();
      case UpdateProfileSuccess() when updateProfileSuccess != null:
        return updateProfileSuccess();
      case UpdateProfileError() when updateProfileError != null:
        return updateProfileError(_that.apiErrorModel);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading();
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess();
      case LogoutError() when logoutError != null:
        return logoutError(_that.apiErrorModel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements ProfileState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.initial()';
  }
}

/// @nodoc

class ProfileLoading implements ProfileState {
  const ProfileLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.loading()';
  }
}

/// @nodoc

class ProfileSuccess implements ProfileState {
  ProfileSuccess(this.model);

  final ProfileResponseModel model;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileSuccessCopyWith<ProfileSuccess> get copyWith =>
      _$ProfileSuccessCopyWithImpl<ProfileSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @override
  String toString() {
    return 'ProfileState.success(model: $model)';
  }
}

/// @nodoc
abstract mixin class $ProfileSuccessCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory $ProfileSuccessCopyWith(
          ProfileSuccess value, $Res Function(ProfileSuccess) _then) =
      _$ProfileSuccessCopyWithImpl;
  @useResult
  $Res call({ProfileResponseModel model});
}

/// @nodoc
class _$ProfileSuccessCopyWithImpl<$Res>
    implements $ProfileSuccessCopyWith<$Res> {
  _$ProfileSuccessCopyWithImpl(this._self, this._then);

  final ProfileSuccess _self;
  final $Res Function(ProfileSuccess) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? model = null,
  }) {
    return _then(ProfileSuccess(
      null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as ProfileResponseModel,
    ));
  }
}

/// @nodoc

class ProfileError implements ProfileState {
  const ProfileError(this.apiErrorModel);

  final ApiErrorModel apiErrorModel;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileErrorCopyWith<ProfileError> get copyWith =>
      _$ProfileErrorCopyWithImpl<ProfileError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileError &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  @override
  String toString() {
    return 'ProfileState.error(apiErrorModel: $apiErrorModel)';
  }
}

/// @nodoc
abstract mixin class $ProfileErrorCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory $ProfileErrorCopyWith(
          ProfileError value, $Res Function(ProfileError) _then) =
      _$ProfileErrorCopyWithImpl;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class _$ProfileErrorCopyWithImpl<$Res> implements $ProfileErrorCopyWith<$Res> {
  _$ProfileErrorCopyWithImpl(this._self, this._then);

  final ProfileError _self;
  final $Res Function(ProfileError) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(ProfileError(
      null == apiErrorModel
          ? _self.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class UpdateProfileLoading implements ProfileState {
  const UpdateProfileLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdateProfileLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.updateProfileLoading()';
  }
}

/// @nodoc

class UpdateProfileSuccess implements ProfileState {
  const UpdateProfileSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdateProfileSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.updateProfileSuccess()';
  }
}

/// @nodoc

class UpdateProfileError implements ProfileState {
  const UpdateProfileError(this.apiErrorModel);

  final ApiErrorModel apiErrorModel;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProfileErrorCopyWith<UpdateProfileError> get copyWith =>
      _$UpdateProfileErrorCopyWithImpl<UpdateProfileError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProfileError &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  @override
  String toString() {
    return 'ProfileState.updateProfileError(apiErrorModel: $apiErrorModel)';
  }
}

/// @nodoc
abstract mixin class $UpdateProfileErrorCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory $UpdateProfileErrorCopyWith(
          UpdateProfileError value, $Res Function(UpdateProfileError) _then) =
      _$UpdateProfileErrorCopyWithImpl;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class _$UpdateProfileErrorCopyWithImpl<$Res>
    implements $UpdateProfileErrorCopyWith<$Res> {
  _$UpdateProfileErrorCopyWithImpl(this._self, this._then);

  final UpdateProfileError _self;
  final $Res Function(UpdateProfileError) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(UpdateProfileError(
      null == apiErrorModel
          ? _self.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class LogoutLoading implements ProfileState {
  const LogoutLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LogoutLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.logoutLoading()';
  }
}

/// @nodoc

class LogoutSuccess implements ProfileState {
  const LogoutSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LogoutSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.logoutSuccess()';
  }
}

/// @nodoc

class LogoutError implements ProfileState {
  const LogoutError(this.apiErrorModel);

  final ApiErrorModel apiErrorModel;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LogoutErrorCopyWith<LogoutError> get copyWith =>
      _$LogoutErrorCopyWithImpl<LogoutError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LogoutError &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  @override
  String toString() {
    return 'ProfileState.logoutError(apiErrorModel: $apiErrorModel)';
  }
}

/// @nodoc
abstract mixin class $LogoutErrorCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory $LogoutErrorCopyWith(
          LogoutError value, $Res Function(LogoutError) _then) =
      _$LogoutErrorCopyWithImpl;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class _$LogoutErrorCopyWithImpl<$Res> implements $LogoutErrorCopyWith<$Res> {
  _$LogoutErrorCopyWithImpl(this._self, this._then);

  final LogoutError _self;
  final $Res Function(LogoutError) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(LogoutError(
      null == apiErrorModel
          ? _self.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

// dart format on
