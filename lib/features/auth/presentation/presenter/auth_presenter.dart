import 'package:flutter/material.dart';
import 'package:huskar/cores/utils/register_listener_fn.dart';
import 'package:huskar/cores/widgets/presenter_widget.dart';
import 'package:huskar/features/auth/presentation/state_management/auth_provider.dart';
import 'package:huskar/features/auth/presentation/states/auth_state.dart';
import 'package:provider/provider.dart';

class AuthPresenter extends PresenterWidget<AuthState> {
  final Widget Function(
    BuildContext context,
    AuthPresenterState authPresenterState,
    AuthState authState,
  ) builer;
  final AuthProvider authProvider;
  const AuthPresenter(
      {super.key, required this.authProvider, required this.builer});

  @override
  PresenterWidgetState<AuthState, PresenterWidget<AuthState>> createState() {
    return AuthPresenterState();
  }
}

class AuthPresenterState
    extends PresenterWidgetState<AuthState, AuthPresenter> {
  @override
  void initState() {
    super.initState();
  }

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
              value.authState,
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

  void authenticate() {
    widget.authProvider.authenticate();
    return;
  }
  void logout() {
    widget.authProvider.logout();
    return;
  }

  @override
  void setListener(ListenerFn<AuthState> listener) {
    if (!mounted) {
      return;
    }
    setState(() {
      widget.authProvider.setAuthStateListener(listener);
    });
    return;
  }
}
