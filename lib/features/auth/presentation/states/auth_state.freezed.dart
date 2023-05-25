// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, String? email) authing,
    required TResult Function(bool isLoading, String email) authed,
    required TResult Function(bool isLoading, String? email) unauthed,
    required TResult Function(bool isLoading, Failure failure, String? email)
        authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? email)? authing,
    TResult? Function(bool isLoading, String email)? authed,
    TResult? Function(bool isLoading, String? email)? unauthed,
    TResult? Function(bool isLoading, Failure failure, String? email)?
        authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? email)? authing,
    TResult Function(bool isLoading, String email)? authed,
    TResult Function(bool isLoading, String? email)? unauthed,
    TResult Function(bool isLoading, Failure failure, String? email)? authError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authing value) authing,
    required TResult Function(Authed value) authed,
    required TResult Function(Unauthed value) unauthed,
    required TResult Function(AuthError value) authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authing value)? authing,
    TResult? Function(Authed value)? authed,
    TResult? Function(Unauthed value)? unauthed,
    TResult? Function(AuthError value)? authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authing value)? authing,
    TResult Function(Authed value)? authed,
    TResult Function(Unauthed value)? unauthed,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({bool isLoading, String email});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email!
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthingCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$AuthingCopyWith(_$Authing value, $Res Function(_$Authing) then) =
      __$$AuthingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? email});
}

/// @nodoc
class __$$AuthingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Authing>
    implements _$$AuthingCopyWith<$Res> {
  __$$AuthingCopyWithImpl(_$Authing _value, $Res Function(_$Authing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = freezed,
  }) {
    return _then(_$Authing(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Authing implements Authing {
  const _$Authing({this.isLoading = true, this.email = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? email;

  @override
  String toString() {
    return 'AuthState.authing(isLoading: $isLoading, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Authing &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthingCopyWith<_$Authing> get copyWith =>
      __$$AuthingCopyWithImpl<_$Authing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, String? email) authing,
    required TResult Function(bool isLoading, String email) authed,
    required TResult Function(bool isLoading, String? email) unauthed,
    required TResult Function(bool isLoading, Failure failure, String? email)
        authError,
  }) {
    return authing(isLoading, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? email)? authing,
    TResult? Function(bool isLoading, String email)? authed,
    TResult? Function(bool isLoading, String? email)? unauthed,
    TResult? Function(bool isLoading, Failure failure, String? email)?
        authError,
  }) {
    return authing?.call(isLoading, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? email)? authing,
    TResult Function(bool isLoading, String email)? authed,
    TResult Function(bool isLoading, String? email)? unauthed,
    TResult Function(bool isLoading, Failure failure, String? email)? authError,
    required TResult orElse(),
  }) {
    if (authing != null) {
      return authing(isLoading, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authing value) authing,
    required TResult Function(Authed value) authed,
    required TResult Function(Unauthed value) unauthed,
    required TResult Function(AuthError value) authError,
  }) {
    return authing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authing value)? authing,
    TResult? Function(Authed value)? authed,
    TResult? Function(Unauthed value)? unauthed,
    TResult? Function(AuthError value)? authError,
  }) {
    return authing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authing value)? authing,
    TResult Function(Authed value)? authed,
    TResult Function(Unauthed value)? unauthed,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (authing != null) {
      return authing(this);
    }
    return orElse();
  }
}

abstract class Authing implements AuthState {
  const factory Authing({final bool isLoading, final String? email}) =
      _$Authing;

  @override
  bool get isLoading;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$AuthingCopyWith<_$Authing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$AuthedCopyWith(_$Authed value, $Res Function(_$Authed) then) =
      __$$AuthedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String email});
}

/// @nodoc
class __$$AuthedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Authed>
    implements _$$AuthedCopyWith<$Res> {
  __$$AuthedCopyWithImpl(_$Authed _value, $Res Function(_$Authed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = null,
  }) {
    return _then(_$Authed(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Authed implements Authed {
  const _$Authed({this.isLoading = false, required this.email});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String email;

  @override
  String toString() {
    return 'AuthState.authed(isLoading: $isLoading, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Authed &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthedCopyWith<_$Authed> get copyWith =>
      __$$AuthedCopyWithImpl<_$Authed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, String? email) authing,
    required TResult Function(bool isLoading, String email) authed,
    required TResult Function(bool isLoading, String? email) unauthed,
    required TResult Function(bool isLoading, Failure failure, String? email)
        authError,
  }) {
    return authed(isLoading, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? email)? authing,
    TResult? Function(bool isLoading, String email)? authed,
    TResult? Function(bool isLoading, String? email)? unauthed,
    TResult? Function(bool isLoading, Failure failure, String? email)?
        authError,
  }) {
    return authed?.call(isLoading, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? email)? authing,
    TResult Function(bool isLoading, String email)? authed,
    TResult Function(bool isLoading, String? email)? unauthed,
    TResult Function(bool isLoading, Failure failure, String? email)? authError,
    required TResult orElse(),
  }) {
    if (authed != null) {
      return authed(isLoading, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authing value) authing,
    required TResult Function(Authed value) authed,
    required TResult Function(Unauthed value) unauthed,
    required TResult Function(AuthError value) authError,
  }) {
    return authed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authing value)? authing,
    TResult? Function(Authed value)? authed,
    TResult? Function(Unauthed value)? unauthed,
    TResult? Function(AuthError value)? authError,
  }) {
    return authed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authing value)? authing,
    TResult Function(Authed value)? authed,
    TResult Function(Unauthed value)? unauthed,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (authed != null) {
      return authed(this);
    }
    return orElse();
  }
}

abstract class Authed implements AuthState {
  const factory Authed({final bool isLoading, required final String email}) =
      _$Authed;

  @override
  bool get isLoading;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$AuthedCopyWith<_$Authed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$UnauthedCopyWith(
          _$Unauthed value, $Res Function(_$Unauthed) then) =
      __$$UnauthedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? email});
}

/// @nodoc
class __$$UnauthedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Unauthed>
    implements _$$UnauthedCopyWith<$Res> {
  __$$UnauthedCopyWithImpl(_$Unauthed _value, $Res Function(_$Unauthed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = freezed,
  }) {
    return _then(_$Unauthed(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Unauthed implements Unauthed {
  const _$Unauthed({this.isLoading = false, this.email = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? email;

  @override
  String toString() {
    return 'AuthState.unauthed(isLoading: $isLoading, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Unauthed &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthedCopyWith<_$Unauthed> get copyWith =>
      __$$UnauthedCopyWithImpl<_$Unauthed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, String? email) authing,
    required TResult Function(bool isLoading, String email) authed,
    required TResult Function(bool isLoading, String? email) unauthed,
    required TResult Function(bool isLoading, Failure failure, String? email)
        authError,
  }) {
    return unauthed(isLoading, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? email)? authing,
    TResult? Function(bool isLoading, String email)? authed,
    TResult? Function(bool isLoading, String? email)? unauthed,
    TResult? Function(bool isLoading, Failure failure, String? email)?
        authError,
  }) {
    return unauthed?.call(isLoading, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? email)? authing,
    TResult Function(bool isLoading, String email)? authed,
    TResult Function(bool isLoading, String? email)? unauthed,
    TResult Function(bool isLoading, Failure failure, String? email)? authError,
    required TResult orElse(),
  }) {
    if (unauthed != null) {
      return unauthed(isLoading, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authing value) authing,
    required TResult Function(Authed value) authed,
    required TResult Function(Unauthed value) unauthed,
    required TResult Function(AuthError value) authError,
  }) {
    return unauthed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authing value)? authing,
    TResult? Function(Authed value)? authed,
    TResult? Function(Unauthed value)? unauthed,
    TResult? Function(AuthError value)? authError,
  }) {
    return unauthed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authing value)? authing,
    TResult Function(Authed value)? authed,
    TResult Function(Unauthed value)? unauthed,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (unauthed != null) {
      return unauthed(this);
    }
    return orElse();
  }
}

abstract class Unauthed implements AuthState {
  const factory Unauthed({final bool isLoading, final String? email}) =
      _$Unauthed;

  @override
  bool get isLoading;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UnauthedCopyWith<_$Unauthed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$AuthErrorCopyWith(
          _$AuthError value, $Res Function(_$AuthError) then) =
      __$$AuthErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, Failure failure, String? email});
}

/// @nodoc
class __$$AuthErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthError>
    implements _$$AuthErrorCopyWith<$Res> {
  __$$AuthErrorCopyWithImpl(
      _$AuthError _value, $Res Function(_$AuthError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failure = null,
    Object? email = freezed,
  }) {
    return _then(_$AuthError(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthError implements AuthError {
  const _$AuthError(
      {this.isLoading = false, required this.failure, this.email = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Failure failure;
  @override
  @JsonKey()
  final String? email;

  @override
  String toString() {
    return 'AuthState.authError(isLoading: $isLoading, failure: $failure, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthError &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, failure, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorCopyWith<_$AuthError> get copyWith =>
      __$$AuthErrorCopyWithImpl<_$AuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, String? email) authing,
    required TResult Function(bool isLoading, String email) authed,
    required TResult Function(bool isLoading, String? email) unauthed,
    required TResult Function(bool isLoading, Failure failure, String? email)
        authError,
  }) {
    return authError(isLoading, failure, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? email)? authing,
    TResult? Function(bool isLoading, String email)? authed,
    TResult? Function(bool isLoading, String? email)? unauthed,
    TResult? Function(bool isLoading, Failure failure, String? email)?
        authError,
  }) {
    return authError?.call(isLoading, failure, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? email)? authing,
    TResult Function(bool isLoading, String email)? authed,
    TResult Function(bool isLoading, String? email)? unauthed,
    TResult Function(bool isLoading, Failure failure, String? email)? authError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(isLoading, failure, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authing value) authing,
    required TResult Function(Authed value) authed,
    required TResult Function(Unauthed value) unauthed,
    required TResult Function(AuthError value) authError,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authing value)? authing,
    TResult? Function(Authed value)? authed,
    TResult? Function(Unauthed value)? unauthed,
    TResult? Function(AuthError value)? authError,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authing value)? authing,
    TResult Function(Authed value)? authed,
    TResult Function(Unauthed value)? unauthed,
    TResult Function(AuthError value)? authError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError(
      {final bool isLoading,
      required final Failure failure,
      final String? email}) = _$AuthError;

  @override
  bool get isLoading;
  Failure get failure;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$AuthErrorCopyWith<_$AuthError> get copyWith =>
      throw _privateConstructorUsedError;
}
