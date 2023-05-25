import 'package:flutter/material.dart';
import 'package:huskar/cores/utils/register_listener_fn.dart';
import 'package:huskar/features/auth/presentation/states/auth_state.dart';
import 'package:huskar/ui/home_screen/home_screen.dart';
import 'package:huskar/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/";
  final void Function() authenticate;
  final RegisterListenerFn<AuthState> registerListener;
  const SplashScreen(
      {super.key, required this.registerListener, required this.authenticate});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.registerListener(authStateListener);
      Future.delayed(Duration(seconds: 1), (){
        widget.authenticate();
      });
    });
  }

  void authStateListener(AuthState authState) {
    return authState.maybeMap<void>(
      authError: (value) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        return;
      },
      authing: (value) {
        return;
      },
      unauthed: (value) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        return;
      },
      authed: (value) {
        debugPrint("authed");
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        return;
      },
      orElse: () {
        return;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              alignment: Alignment.center,
              child: const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
