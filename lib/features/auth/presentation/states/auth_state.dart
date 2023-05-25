import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huskar/cores/failures/failure.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authing({
    @Default(true) bool isLoading,
    @Default(null) String? email,
  }) = Authing;

  const factory AuthState.authed({
    @Default(false) bool isLoading,
    required String email,
  }) = Authed;

  const factory AuthState.unauthed({
    @Default(false) bool isLoading,
    @Default(null) String? email,
  }) = Unauthed;

  const factory AuthState.authError({
    @Default(false) bool isLoading,
    required Failure failure,
    @Default(null) String? email,
  }) = AuthError;
}
