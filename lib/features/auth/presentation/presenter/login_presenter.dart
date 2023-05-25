import 'package:flutter/material.dart';
import 'package:huskar/cores/constants/regex_constant.dart';
import 'package:huskar/cores/utils/register_listener_fn.dart';
import 'package:huskar/cores/widgets/presenter_widget.dart';
import 'package:huskar/features/auth/presentation/state_management/auth_provider.dart';
import 'package:huskar/features/auth/presentation/states/login_state.dart';
import 'package:provider/provider.dart';

class LoginPresenter extends PresenterWidget<LoginState> {
  final Widget Function(
    BuildContext context,
    LoginPresenterState loginPresenterState,
    LoginState loginState,
  ) builer;
  final AuthProvider authProvider;
  const LoginPresenter(
      {super.key, required this.authProvider, required this.builer});

  @override
  PresenterWidgetState<LoginState, PresenterWidget<LoginState>> createState() {
    return LoginPresenterState();
  }
}

class LoginPresenterState
    extends PresenterWidgetState<LoginState, LoginPresenter> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.authProvider,
      builder: (context, child) {
        return Consumer<AuthProvider>(
          builder: (context, value, child) {
            return widget.builer(
              context,
              this,
              value.loginState,
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? Function(String? value) get passwordValidator {
    return (value) {
      if (value == null) {
        return "Password Required";
      }
      if (value.isEmpty) {
        return "Password Required";
      }
      return null;
    };
  }

  String? Function(String? value) get emailValidator {
    return (value) {
      if (value == null) {
        return "Email Required";
      }
      if (value.isEmpty) {
        return "Email Required";
      }
      var regex = RegexConstant.emailRegex;
      if (!regex.hasMatch(value)) {
        return "Invalid Email";
      }
      return null;
    };
  }

  void login(String email, String password) {
    widget.authProvider.login(email: email, password: password);
    return;
  }

  @override
  void setListener(ListenerFn<LoginState> listener) {
    if (!mounted) {
      return;
    }
    widget.authProvider.setLoginStateListener(listener);
    return;
  }
}
