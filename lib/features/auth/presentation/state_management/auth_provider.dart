import 'package:flutter/material.dart';
import 'package:huskar/cores/usecase/usecase.dart';
import 'package:huskar/cores/utils/register_listener_fn.dart';
import 'package:huskar/features/auth/domain/usecases/authenticate_usecase.dart';
import 'package:huskar/features/auth/domain/usecases/login_usecase.dart';
import 'package:huskar/features/auth/domain/usecases/logout_usecase.dart';
import 'package:huskar/features/auth/presentation/states/auth_state.dart';
import 'package:huskar/features/auth/presentation/states/login_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthProvider extends ValueNotifier<(AuthState, LoginState)> {
  final AuthenticateUsecase _authenticateUsecase;
  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;

  AuthProvider({
    required AuthenticateUsecase authenticateUsecase,
    required LoginUsecase loginUsecase,
    required LogoutUsecase logoutUsecase,
  })  : _authenticateUsecase = authenticateUsecase,
        _loginUsecase = loginUsecase,
        _logoutUsecase = logoutUsecase,
        super((const AuthState.authing(), const LoginState.initial()));

  Function(AuthState authState)? authStateListener;
  Function(LoginState loginState)? loginStateListener;

  (AuthState, LoginState) get state => super.value;

  LoginState get loginState => value.$2;
  AuthState get authState => value.$1;

  @override
  void dispose() {
    removeAuthStateListener();
    removeLoginStateListener();
    super.dispose();
  }

  Future<void> login({
    required String email,
    required String password,
  }) {
    _emit((authState, const LoginState.processing()));
    return _loginUsecase((email, password)).then((result) {
      return result.maybeMap<void>(
        ok: (value) {
          _emit((authState, const LoginState.success()));
          authenticate();
          return;
        },
        err: (value) {
          _emit((authState, LoginState.fail(failure: value.data)));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }

  Future<void> authenticate() {
    _emit((const AuthState.authing(), loginState));
    return _authenticateUsecase(NoUsecaseParams()).then((result) {
      return result.maybeMap<void>(
        ok: (value) {
          var email = value.data;
          if (email == null) {
            _emit((const AuthState.unauthed(), loginState));
            return;
          }
          _emit((AuthState.authed(email: email), loginState));
          return;
        },
        err: (value) {
          _emit((AuthState.authError(failure: value.data), loginState));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }

  void _emit((AuthState?, LoginState?) params) {
    var prevState = state;
    var newAuthState = params.$1 ?? authState;
    var newLoginState = params.$2 ?? loginState;

    super.value = (newAuthState, newLoginState);

    notifyListeners();
    notifyAuthListener(prevState.$1, newAuthState);
    notifyLoginListener(prevState.$2, newLoginState);
    return;
  }

  void notifyAuthListener(AuthState prev, AuthState nextState) {
    if (prev == nextState) {
      return;
    }
    authStateListener?.call(nextState);
    return;
  }

  void notifyLoginListener(LoginState prev, LoginState nextState) {
    if (prev == nextState) {
      return;
    }
    loginStateListener?.call(nextState);
    return;
  }

  void setAuthStateListener(ListenerFn<AuthState> listener) {
    authStateListener = listener;
    notifyListeners();
  }

  void removeAuthStateListener() {
    authStateListener = null;
    notifyListeners();
  }

  void setLoginStateListener(ListenerFn<LoginState> listener) {
    loginStateListener = listener;
    notifyListeners();
  }

  void removeLoginStateListener() {
    loginStateListener = null;
    notifyListeners();
  }

  Future<void> logout() {
    return _logoutUsecase(NoUsecaseParams()).then((result) {
      return result.maybeMap<void>(
        err: (value) {
          _emit((
            AuthState.authError(failure: value.data, email: authState.email),
            loginState
          ));
          return;
        },
        ok: (value) {
          _emit((const AuthState.unauthed(), loginState));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }
}
