// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/dependency.dart';
import 'package:huskar/features/auth/presentation/presenter/auth_presenter.dart';
import 'package:huskar/features/auth/presentation/presenter/login_presenter.dart';
import 'package:huskar/features/auth/presentation/state_management/auth_provider.dart';
import 'package:huskar/ui/home_screen/home_screen.dart';
import 'package:huskar/ui/login_screen.dart';
import 'package:huskar/ui/profile_edit_screen/profile_edit_screen.dart';
import 'package:huskar/ui/register_screen.dart';
import 'package:huskar/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();

  runApp(MyApp(instance: instance));
}

class MyApp extends StatelessWidget {
  final GetIt instance;
  late AuthProvider authProvider;
  MyApp({super.key, required this.instance}) {
    authProvider = instance.get();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huskar',
      theme: const AppTheme(false).themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeBuilder,
      initialRoute: SplashScreen.routeName,
    );
  }

  Widget _splashScreenBuilder() {
    return AuthPresenter(
      authProvider: authProvider,
      builer: (context, presenterState, authState) {
        return SplashScreen(
            registerListener: presenterState.setListener,
            authenticate: presenterState.authenticate);
      },
    );
  }

  Widget _loginScreenBuilder() {
    return AuthPresenter(
      authProvider: authProvider,
      builer: (context, authPresenterState, authState) {
        return LoginPresenter(
          authProvider: authProvider,
          builer: (context, loginPresenterState, loginState) {
            return LoginScreen(
              loginState: loginState,
              emailValidator: loginPresenterState.emailValidator,
              passwordValidator: loginPresenterState.passwordValidator,
              onLogin: loginPresenterState.login,
              registerAuthStateListener: authPresenterState.setListener,
              registerLoginStateListener: loginPresenterState.setListener,
            );
          },
        );
      },
    );
  }

  Widget _homeScreenBuilder() {
    print("navigate to home");
    return AuthPresenter(
      authProvider: authProvider,
      builer: (context, authPresenterState, authState) {
        return HomeScreen(
          onLogout: authPresenterState.logout,
          registerListener: authPresenterState.setListener,
        );
      },
    );
  }

  Widget _profileEditBuilder() {
    return AuthPresenter(
      authProvider: authProvider,
      builer: (context, authPresenterState, authState) {
        return ProfileEditScreen(
          onLogout: authPresenterState.logout,
          registerListener: authPresenterState.setListener,
        );
      },
    );
  }

  Route routeBuilder(RouteSettings settings) {
    print(settings.name);
    if (SplashScreen.routeName == settings.name) {
      return getRoute(_splashScreenBuilder());
    }
    if (LoginScreen.routeName == settings.name) {
      return getRoute(_loginScreenBuilder());
    }
    if (HomeScreen.routeName == settings.name) {
      return getRoute(_homeScreenBuilder());
    }
    if (RegisterScreen.routeName == settings.name) {
      return getRoute(const RegisterScreen());
    }
    if (ProfileEditScreen.routeName == settings.name) {
      return getRoute(_profileEditBuilder());
    }
    return getRoute(_splashScreenBuilder());
  }

  Route getRoute(Widget child) {
    if (Platform.isIOS || Platform.isMacOS) {
      return iosRoute(child);
    }
    return androidRoute(child);
  }

  MaterialPageRoute androidRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  CupertinoPageRoute iosRoute(Widget child) {
    return CupertinoPageRoute(builder: (_) => child);
  }
}
