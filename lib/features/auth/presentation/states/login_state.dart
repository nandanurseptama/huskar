import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huskar/cores/failures/failure.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(true) bool isInitial,
  }) = _LoginInitial;
  const factory LoginState.processing({
    @Default(false) bool isInitial,
    @Default(true) bool isLoading,
  }) = _LoginProcessing;

  const factory LoginState.success({
    @Default(false) bool isInitial,
    @Default(false) bool isLoading,
  }) = _LoginSuccess;

  const factory LoginState.fail({
    @Default(false) bool isInitial,
    @Default(false) bool isLoading,
    required Failure failure,
  }) = _LoginFailure;
}
