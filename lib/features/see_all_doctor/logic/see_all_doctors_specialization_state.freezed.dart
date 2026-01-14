// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'see_all_doctors_specialization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeeAllDoctorsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeeAllDoctorsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeeAllDoctorsState()';
  }
}

/// @nodoc
class $SeeAllDoctorsStateCopyWith<$Res> {
  $SeeAllDoctorsStateCopyWith(
      SeeAllDoctorsState _, $Res Function(SeeAllDoctorsState) __);
}

/// Adds pattern-matching-related methods to [SeeAllDoctorsState].
extension SeeAllDoctorsStatePatterns on SeeAllDoctorsState {
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
    TResult Function(SeeAllDoctorsLoading value)? loading,
    TResult Function(SeeAllDoctorsSuccess value)? success,
    TResult Function(SeeAllDoctorsError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case SeeAllDoctorsLoading() when loading != null:
        return loading(_that);
      case SeeAllDoctorsSuccess() when success != null:
        return success(_that);
      case SeeAllDoctorsError() when error != null:
        return error(_that);
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
    required TResult Function(SeeAllDoctorsLoading value) loading,
    required TResult Function(SeeAllDoctorsSuccess value) success,
    required TResult Function(SeeAllDoctorsError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case SeeAllDoctorsLoading():
        return loading(_that);
      case SeeAllDoctorsSuccess():
        return success(_that);
      case SeeAllDoctorsError():
        return error(_that);
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
    TResult? Function(SeeAllDoctorsLoading value)? loading,
    TResult? Function(SeeAllDoctorsSuccess value)? success,
    TResult? Function(SeeAllDoctorsError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case SeeAllDoctorsLoading() when loading != null:
        return loading(_that);
      case SeeAllDoctorsSuccess() when success != null:
        return success(_that);
      case SeeAllDoctorsError() when error != null:
        return error(_that);
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
    TResult Function(DoctorSpecializationsResponseModel model)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case SeeAllDoctorsLoading() when loading != null:
        return loading();
      case SeeAllDoctorsSuccess() when success != null:
        return success(_that.model);
      case SeeAllDoctorsError() when error != null:
        return error(_that.apiErrorModel);
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
    required TResult Function(DoctorSpecializationsResponseModel model) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case SeeAllDoctorsLoading():
        return loading();
      case SeeAllDoctorsSuccess():
        return success(_that.model);
      case SeeAllDoctorsError():
        return error(_that.apiErrorModel);
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
    TResult? Function(DoctorSpecializationsResponseModel model)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case SeeAllDoctorsLoading() when loading != null:
        return loading();
      case SeeAllDoctorsSuccess() when success != null:
        return success(_that.model);
      case SeeAllDoctorsError() when error != null:
        return error(_that.apiErrorModel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements SeeAllDoctorsState {
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
    return 'SeeAllDoctorsState.initial()';
  }
}

/// @nodoc

class SeeAllDoctorsLoading implements SeeAllDoctorsState {
  const SeeAllDoctorsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeeAllDoctorsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeeAllDoctorsState.loading()';
  }
}

/// @nodoc

class SeeAllDoctorsSuccess implements SeeAllDoctorsState {
  SeeAllDoctorsSuccess(this.model);

  final DoctorSpecializationsResponseModel model;

  /// Create a copy of SeeAllDoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeeAllDoctorsSuccessCopyWith<SeeAllDoctorsSuccess> get copyWith =>
      _$SeeAllDoctorsSuccessCopyWithImpl<SeeAllDoctorsSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeeAllDoctorsSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @override
  String toString() {
    return 'SeeAllDoctorsState.success(model: $model)';
  }
}

/// @nodoc
abstract mixin class $SeeAllDoctorsSuccessCopyWith<$Res>
    implements $SeeAllDoctorsStateCopyWith<$Res> {
  factory $SeeAllDoctorsSuccessCopyWith(SeeAllDoctorsSuccess value,
          $Res Function(SeeAllDoctorsSuccess) _then) =
      _$SeeAllDoctorsSuccessCopyWithImpl;
  @useResult
  $Res call({DoctorSpecializationsResponseModel model});
}

/// @nodoc
class _$SeeAllDoctorsSuccessCopyWithImpl<$Res>
    implements $SeeAllDoctorsSuccessCopyWith<$Res> {
  _$SeeAllDoctorsSuccessCopyWithImpl(this._self, this._then);

  final SeeAllDoctorsSuccess _self;
  final $Res Function(SeeAllDoctorsSuccess) _then;

  /// Create a copy of SeeAllDoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? model = null,
  }) {
    return _then(SeeAllDoctorsSuccess(
      null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as DoctorSpecializationsResponseModel,
    ));
  }
}

/// @nodoc

class SeeAllDoctorsError implements SeeAllDoctorsState {
  const SeeAllDoctorsError(this.apiErrorModel);

  final ApiErrorModel apiErrorModel;

  /// Create a copy of SeeAllDoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeeAllDoctorsErrorCopyWith<SeeAllDoctorsError> get copyWith =>
      _$SeeAllDoctorsErrorCopyWithImpl<SeeAllDoctorsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeeAllDoctorsError &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  @override
  String toString() {
    return 'SeeAllDoctorsState.error(apiErrorModel: $apiErrorModel)';
  }
}

/// @nodoc
abstract mixin class $SeeAllDoctorsErrorCopyWith<$Res>
    implements $SeeAllDoctorsStateCopyWith<$Res> {
  factory $SeeAllDoctorsErrorCopyWith(
          SeeAllDoctorsError value, $Res Function(SeeAllDoctorsError) _then) =
      _$SeeAllDoctorsErrorCopyWithImpl;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class _$SeeAllDoctorsErrorCopyWithImpl<$Res>
    implements $SeeAllDoctorsErrorCopyWith<$Res> {
  _$SeeAllDoctorsErrorCopyWithImpl(this._self, this._then);

  final SeeAllDoctorsError _self;
  final $Res Function(SeeAllDoctorsError) _then;

  /// Create a copy of SeeAllDoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(SeeAllDoctorsError(
      null == apiErrorModel
          ? _self.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

// dart format on
