// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  bool get isInitial => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial) initial,
    required TResult Function(bool isInitial, bool isLoading) processing,
    required TResult Function(bool isInitial, bool isLoading) success,
    required TResult Function(bool isInitial, bool isLoading, Failure failure)
        fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial)? initial,
    TResult? Function(bool isInitial, bool isLoading)? processing,
    TResult? Function(bool isInitial, bool isLoading)? success,
    TResult? Function(bool isInitial, bool isLoading, Failure failure)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial)? initial,
    TResult Function(bool isInitial, bool isLoading)? processing,
    TResult Function(bool isInitial, bool isLoading)? success,
    TResult Function(bool isInitial, bool isLoading, Failure failure)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitial value) initial,
    required TResult Function(_LoginProcessing value) processing,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginFailure value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginInitial value)? initial,
    TResult? Function(_LoginProcessing value)? processing,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginFailure value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitial value)? initial,
    TResult Function(_LoginProcessing value)? processing,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginFailure value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({bool isInitial});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
  }) {
    return _then(_value.copyWith(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginInitialCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginInitialCopyWith(
          _$_LoginInitial value, $Res Function(_$_LoginInitial) then) =
      __$$_LoginInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInitial});
}

/// @nodoc
class __$$_LoginInitialCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginInitial>
    implements _$$_LoginInitialCopyWith<$Res> {
  __$$_LoginInitialCopyWithImpl(
      _$_LoginInitial _value, $Res Function(_$_LoginInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
  }) {
    return _then(_$_LoginInitial(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginInitial implements _LoginInitial {
  const _$_LoginInitial({this.isInitial = true});

  @override
  @JsonKey()
  final bool isInitial;

  @override
  String toString() {
    return 'LoginState.initial(isInitial: $isInitial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginInitial &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginInitialCopyWith<_$_LoginInitial> get copyWith =>
      __$$_LoginInitialCopyWithImpl<_$_LoginInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial) initial,
    required TResult Function(bool isInitial, bool isLoading) processing,
    required TResult Function(bool isInitial, bool isLoading) success,
    required TResult Function(bool isInitial, bool isLoading, Failure failure)
        fail,
  }) {
    return initial(isInitial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial)? initial,
    TResult? Function(bool isInitial, bool isLoading)? processing,
    TResult? Function(bool isInitial, bool isLoading)? success,
    TResult? Function(bool isInitial, bool isLoading, Failure failure)? fail,
  }) {
    return initial?.call(isInitial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial)? initial,
    TResult Function(bool isInitial, bool isLoading)? processing,
    TResult Function(bool isInitial, bool isLoading)? success,
    TResult Function(bool isInitial, bool isLoading, Failure failure)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isInitial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitial value) initial,
    required TResult Function(_LoginProcessing value) processing,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginFailure value) fail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginInitial value)? initial,
    TResult? Function(_LoginProcessing value)? processing,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginFailure value)? fail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitial value)? initial,
    TResult Function(_LoginProcessing value)? processing,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginFailure value)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _LoginInitial implements LoginState {
  const factory _LoginInitial({final bool isInitial}) = _$_LoginInitial;

  @override
  bool get isInitial;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInitialCopyWith<_$_LoginInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginProcessingCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginProcessingCopyWith(
          _$_LoginProcessing value, $Res Function(_$_LoginProcessing) then) =
      __$$_LoginProcessingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInitial, bool isLoading});
}

/// @nodoc
class __$$_LoginProcessingCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginProcessing>
    implements _$$_LoginProcessingCopyWith<$Res> {
  __$$_LoginProcessingCopyWithImpl(
      _$_LoginProcessing _value, $Res Function(_$_LoginProcessing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isLoading = null,
  }) {
    return _then(_$_LoginProcessing(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginProcessing implements _LoginProcessing {
  const _$_LoginProcessing({this.isInitial = false, this.isLoading = true});

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'LoginState.processing(isInitial: $isInitial, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginProcessing &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitial, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginProcessingCopyWith<_$_LoginProcessing> get copyWith =>
      __$$_LoginProcessingCopyWithImpl<_$_LoginProcessing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial) initial,
    required TResult Function(bool isInitial, bool isLoading) processing,
    required TResult Function(bool isInitial, bool isLoading) success,
    required TResult Function(bool isInitial, bool isLoading, Failure failure)
        fail,
  }) {
    return processing(isInitial, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial)? initial,
    TResult? Function(bool isInitial, bool isLoading)? processing,
    TResult? Function(bool isInitial, bool isLoading)? success,
    TResult? Function(bool isInitial, bool isLoading, Failure failure)? fail,
  }) {
    return processing?.call(isInitial, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial)? initial,
    TResult Function(bool isInitial, bool isLoading)? processing,
    TResult Function(bool isInitial, bool isLoading)? success,
    TResult Function(bool isInitial, bool isLoading, Failure failure)? fail,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(isInitial, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitial value) initial,
    required TResult Function(_LoginProcessing value) processing,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginFailure value) fail,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginInitial value)? initial,
    TResult? Function(_LoginProcessing value)? processing,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginFailure value)? fail,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitial value)? initial,
    TResult Function(_LoginProcessing value)? processing,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginFailure value)? fail,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _LoginProcessing implements LoginState {
  const factory _LoginProcessing({final bool isInitial, final bool isLoading}) =
      _$_LoginProcessing;

  @override
  bool get isInitial;
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_LoginProcessingCopyWith<_$_LoginProcessing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginSuccessCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginSuccessCopyWith(
          _$_LoginSuccess value, $Res Function(_$_LoginSuccess) then) =
      __$$_LoginSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInitial, bool isLoading});
}

/// @nodoc
class __$$_LoginSuccessCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginSuccess>
    implements _$$_LoginSuccessCopyWith<$Res> {
  __$$_LoginSuccessCopyWithImpl(
      _$_LoginSuccess _value, $Res Function(_$_LoginSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isLoading = null,
  }) {
    return _then(_$_LoginSuccess(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginSuccess implements _LoginSuccess {
  const _$_LoginSuccess({this.isInitial = false, this.isLoading = false});

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'LoginState.success(isInitial: $isInitial, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginSuccess &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitial, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginSuccessCopyWith<_$_LoginSuccess> get copyWith =>
      __$$_LoginSuccessCopyWithImpl<_$_LoginSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial) initial,
    required TResult Function(bool isInitial, bool isLoading) processing,
    required TResult Function(bool isInitial, bool isLoading) success,
    required TResult Function(bool isInitial, bool isLoading, Failure failure)
        fail,
  }) {
    return success(isInitial, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial)? initial,
    TResult? Function(bool isInitial, bool isLoading)? processing,
    TResult? Function(bool isInitial, bool isLoading)? success,
    TResult? Function(bool isInitial, bool isLoading, Failure failure)? fail,
  }) {
    return success?.call(isInitial, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial)? initial,
    TResult Function(bool isInitial, bool isLoading)? processing,
    TResult Function(bool isInitial, bool isLoading)? success,
    TResult Function(bool isInitial, bool isLoading, Failure failure)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(isInitial, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitial value) initial,
    required TResult Function(_LoginProcessing value) processing,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginFailure value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginInitial value)? initial,
    TResult? Function(_LoginProcessing value)? processing,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginFailure value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitial value)? initial,
    TResult Function(_LoginProcessing value)? processing,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginFailure value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccess implements LoginState {
  const factory _LoginSuccess({final bool isInitial, final bool isLoading}) =
      _$_LoginSuccess;

  @override
  bool get isInitial;
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_LoginSuccessCopyWith<_$_LoginSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginFailureCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginFailureCopyWith(
          _$_LoginFailure value, $Res Function(_$_LoginFailure) then) =
      __$$_LoginFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInitial, bool isLoading, Failure failure});
}

/// @nodoc
class __$$_LoginFailureCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginFailure>
    implements _$$_LoginFailureCopyWith<$Res> {
  __$$_LoginFailureCopyWithImpl(
      _$_LoginFailure _value, $Res Function(_$_LoginFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isLoading = null,
    Object? failure = null,
  }) {
    return _then(_$_LoginFailure(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_LoginFailure implements _LoginFailure {
  const _$_LoginFailure(
      {this.isInitial = false, this.isLoading = false, required this.failure});

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'LoginState.fail(isInitial: $isInitial, isLoading: $isLoading, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFailure &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitial, isLoading, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFailureCopyWith<_$_LoginFailure> get copyWith =>
      __$$_LoginFailureCopyWithImpl<_$_LoginFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial) initial,
    required TResult Function(bool isInitial, bool isLoading) processing,
    required TResult Function(bool isInitial, bool isLoading) success,
    required TResult Function(bool isInitial, bool isLoading, Failure failure)
        fail,
  }) {
    return fail(isInitial, isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial)? initial,
    TResult? Function(bool isInitial, bool isLoading)? processing,
    TResult? Function(bool isInitial, bool isLoading)? success,
    TResult? Function(bool isInitial, bool isLoading, Failure failure)? fail,
  }) {
    return fail?.call(isInitial, isLoading, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial)? initial,
    TResult Function(bool isInitial, bool isLoading)? processing,
    TResult Function(bool isInitial, bool isLoading)? success,
    TResult Function(bool isInitial, bool isLoading, Failure failure)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(isInitial, isLoading, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitial value) initial,
    required TResult Function(_LoginProcessing value) processing,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginFailure value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginInitial value)? initial,
    TResult? Function(_LoginProcessing value)? processing,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginFailure value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitial value)? initial,
    TResult Function(_LoginProcessing value)? processing,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginFailure value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class _LoginFailure implements LoginState {
  const factory _LoginFailure(
      {final bool isInitial,
      final bool isLoading,
      required final Failure failure}) = _$_LoginFailure;

  @override
  bool get isInitial;
  bool get isLoading;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFailureCopyWith<_$_LoginFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
