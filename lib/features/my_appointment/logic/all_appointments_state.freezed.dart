// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_appointments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllAppointmentsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AllAppointmentsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AllAppointmentsState()';
  }
}

/// @nodoc
class $AllAppointmentsStateCopyWith<$Res> {
  $AllAppointmentsStateCopyWith(
      AllAppointmentsState _, $Res Function(AllAppointmentsState) __);
}

/// Adds pattern-matching-related methods to [AllAppointmentsState].
extension AllAppointmentsStatePatterns on AllAppointmentsState {
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
    TResult Function(AllAppointmentLoading value)? loading,
    TResult Function(AllAppointmentSuccess value)? success,
    TResult Function(AllAppointmentError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case AllAppointmentLoading() when loading != null:
        return loading(_that);
      case AllAppointmentSuccess() when success != null:
        return success(_that);
      case AllAppointmentError() when error != null:
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
    required TResult Function(AllAppointmentLoading value) loading,
    required TResult Function(AllAppointmentSuccess value) success,
    required TResult Function(AllAppointmentError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case AllAppointmentLoading():
        return loading(_that);
      case AllAppointmentSuccess():
        return success(_that);
      case AllAppointmentError():
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
    TResult? Function(AllAppointmentLoading value)? loading,
    TResult? Function(AllAppointmentSuccess value)? success,
    TResult? Function(AllAppointmentError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case AllAppointmentLoading() when loading != null:
        return loading(_that);
      case AllAppointmentSuccess() when success != null:
        return success(_that);
      case AllAppointmentError() when error != null:
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
    TResult Function(AllAppointmentResponseBody model)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case AllAppointmentLoading() when loading != null:
        return loading();
      case AllAppointmentSuccess() when success != null:
        return success(_that.model);
      case AllAppointmentError() when error != null:
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
    required TResult Function(AllAppointmentResponseBody model) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case AllAppointmentLoading():
        return loading();
      case AllAppointmentSuccess():
        return success(_that.model);
      case AllAppointmentError():
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
    TResult? Function(AllAppointmentResponseBody model)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case AllAppointmentLoading() when loading != null:
        return loading();
      case AllAppointmentSuccess() when success != null:
        return success(_that.model);
      case AllAppointmentError() when error != null:
        return error(_that.apiErrorModel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements AllAppointmentsState {
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
    return 'AllAppointmentsState.initial()';
  }
}

/// @nodoc

class AllAppointmentLoading implements AllAppointmentsState {
  const AllAppointmentLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AllAppointmentLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AllAppointmentsState.loading()';
  }
}

/// @nodoc

class AllAppointmentSuccess implements AllAppointmentsState {
  AllAppointmentSuccess(this.model);

  final AllAppointmentResponseBody model;

  /// Create a copy of AllAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AllAppointmentSuccessCopyWith<AllAppointmentSuccess> get copyWith =>
      _$AllAppointmentSuccessCopyWithImpl<AllAppointmentSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AllAppointmentSuccess &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @override
  String toString() {
    return 'AllAppointmentsState.success(model: $model)';
  }
}

/// @nodoc
abstract mixin class $AllAppointmentSuccessCopyWith<$Res>
    implements $AllAppointmentsStateCopyWith<$Res> {
  factory $AllAppointmentSuccessCopyWith(AllAppointmentSuccess value,
          $Res Function(AllAppointmentSuccess) _then) =
      _$AllAppointmentSuccessCopyWithImpl;
  @useResult
  $Res call({AllAppointmentResponseBody model});
}

/// @nodoc
class _$AllAppointmentSuccessCopyWithImpl<$Res>
    implements $AllAppointmentSuccessCopyWith<$Res> {
  _$AllAppointmentSuccessCopyWithImpl(this._self, this._then);

  final AllAppointmentSuccess _self;
  final $Res Function(AllAppointmentSuccess) _then;

  /// Create a copy of AllAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? model = null,
  }) {
    return _then(AllAppointmentSuccess(
      null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as AllAppointmentResponseBody,
    ));
  }
}

/// @nodoc

class AllAppointmentError implements AllAppointmentsState {
  const AllAppointmentError(this.apiErrorModel);

  final ApiErrorModel apiErrorModel;

  /// Create a copy of AllAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AllAppointmentErrorCopyWith<AllAppointmentError> get copyWith =>
      _$AllAppointmentErrorCopyWithImpl<AllAppointmentError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AllAppointmentError &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  @override
  String toString() {
    return 'AllAppointmentsState.error(apiErrorModel: $apiErrorModel)';
  }
}

/// @nodoc
abstract mixin class $AllAppointmentErrorCopyWith<$Res>
    implements $AllAppointmentsStateCopyWith<$Res> {
  factory $AllAppointmentErrorCopyWith(
          AllAppointmentError value, $Res Function(AllAppointmentError) _then) =
      _$AllAppointmentErrorCopyWithImpl;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class _$AllAppointmentErrorCopyWithImpl<$Res>
    implements $AllAppointmentErrorCopyWith<$Res> {
  _$AllAppointmentErrorCopyWithImpl(this._self, this._then);

  final AllAppointmentError _self;
  final $Res Function(AllAppointmentError) _then;

  /// Create a copy of AllAppointmentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(AllAppointmentError(
      null == apiErrorModel
          ? _self.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

// dart format on
