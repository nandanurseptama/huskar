import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/constants/assets_path.dart';
import 'package:huskar/cores/utils/dialogs.dart';
import 'package:huskar/cores/utils/register_listener_fn.dart';
import 'package:huskar/cores/utils/snackbar.dart';
import 'package:huskar/features/auth/presentation/states/auth_state.dart';
import 'package:huskar/features/auth/presentation/states/login_state.dart';
import 'package:huskar/ui/home_screen/home_screen.dart';
import 'package:huskar/ui/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final LoginState loginState;
  final String? Function(String? value) emailValidator, passwordValidator;

  final void Function(String email, String password) onLogin;

  final RegisterListenerFn<LoginState> registerLoginStateListener;
  final RegisterListenerFn<AuthState> registerAuthStateListener;

  static String routeName = "/auth/login";

  const LoginScreen(
      {super.key,
      required this.loginState,
      required this.onLogin,
      required this.passwordValidator,
      required this.emailValidator,
      required this.registerLoginStateListener,
      required this.registerAuthStateListener});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _passwordFieldFocusNode = FocusNode(),
      _emailFieldFocusNode = FocusNode();
  final TextEditingController _passwordFieldController =
          TextEditingController(),
      _emailFieldController = TextEditingController();
  final ValueNotifier<bool> _isPasswordShown = ValueNotifier(false);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.registerLoginStateListener(registerLoginStateListener);
      widget.registerAuthStateListener(registerAuthStateListener);
    });
    super.initState();
  }

  void registerLoginStateListener(LoginState state) {
    return state.maybeMap<void>(
      fail: (value) {
        showErrorDialog(
            context: context,
            processId: value.failure.processId,
            message: value.failure.message);
        return;
      },
      processing: (value) {
        showSnackbarMessage(context: context, message: "Signing...");
        return;
      },
      orElse: () {
        return;
      },
    );
  }

  void registerAuthStateListener(AuthState state) {
    return state.maybeMap<void>(
      authed: (value) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        return;
      },
      authError: (value) {
        showErrorDialog(
            context: context,
            processId: value.failure.processId,
            message: value.failure.message);
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
              constraints: constraints,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40, top: 40),
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      subtitle,
                      image,
                      getField(
                          labelLeft: "Email",
                          hint: "Masukkan email anda",
                          focusNode: _emailFieldFocusNode,
                          controller: _emailFieldController,
                          validator: widget.emailValidator),
                      const SizedBox(
                        height: 40,
                      ),
                      passwordField,
                      buttonLogin,
                      didNothaveAnAccount,
                      copyRightText
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get passwordField {
    return ValueListenableBuilder<bool>(
        valueListenable: _isPasswordShown,
        builder: (context, v, _) {
          return getField(
              labelLeft: "Password",
              labelRight: "Lupa Password ?",
              hint: "Masukkan password anda",
              validator: widget.passwordValidator,
              controller: _passwordFieldController,
              focusNode: _passwordFieldFocusNode,
              obSecure: !v,
              suffix: InkWell(
                onTap: () {
                  setState(() {
                    _isPasswordShown.value = !_isPasswordShown.value;
                  });
                  return;
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: AppTheme.of(context).textPrimaryColor,
                ),
              ));
        });
  }

  Widget _verticalPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: child,
    );
  }

  Widget get title {
    var style = Theme.of(context).textTheme.titleLarge;
    return _verticalPadding(
      child: Text.rich(
        TextSpan(text: "Hai, ", children: [
          TextSpan(
            text: "Selamat Datang",
            style: style?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 28,
                letterSpacing: -0.3,
                color: AppTheme.of(context).textPrimaryColor),
          ),
        ]),
        textAlign: TextAlign.left,
        style: style?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 28,
            letterSpacing: -0.3,
            color: AppTheme.of(context).textPrimaryColor),
      ),
    );
  }

  Widget get subtitle {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 20, left: 20),
            child: Text(
              "Silahkan login untuk melanjutkan",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Proxima-Nova",
                    color: AppTheme.of(context).textSecondayColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get image {
    String src = AssetPath.authImageHeaderImage;
    debugPrint(src);
    return MediaQuery.removePadding(
        context: context,
        removeRight: true,
        child: Container(
          alignment: Alignment.topRight,
          child: Image.asset(
            src,
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget getField({
    required String labelLeft,
    String? labelRight,
    required String hint,
    TextEditingController? controller,
    FocusNode? focusNode,
    Widget? suffix,
    bool obSecure = false,
    String? Function(String? value)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20, right: labelRight != null ? 0 : 20, bottom: 16),
                child: Text(
                  labelLeft,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.of(context).textPrimaryColor),
                ),
              ),
            ),
            if (labelRight != null)
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 16),
                child: Text(
                  labelRight,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.of(context).textSecondayColor),
                ),
              ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _verticalPadding(
                child: TextFormField(
                  maxLines: 1,
                  obscureText: obSecure,
                  controller: controller,
                  focusNode: focusNode,
                  validator: validator,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 24, right: 24, top: 13),
                    hintText: hint,
                    suffixIcon: suffix,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get buttonLogin {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
                AppTheme.of(context).buttonShadowPrimary,
              ]),
              child: FilledButton(
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size.fromHeight(48)),
                    shadowColor: MaterialStatePropertyAll(
                        AppTheme.of(context).buttonShadowPrimary.color),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16)),
                    surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                    backgroundColor:
                        MaterialStatePropertyAll(AppTheme.of(context).primaryColor),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide.none)),
                  ),
                  onPressed: onLogin,
                  child: widget.loginState.maybeMap<Widget>(
                    processing: (value) {
                      return const SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      );
                    },
                    orElse: () {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          const SizedBox(width: 40, child: Icon(Icons.arrow_forward)),
                        ],
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void onLogin() {
    if (_formKey.currentState?.validate() == true) {
      widget.onLogin(_emailFieldController.text, _passwordFieldController.text);
      return;
    }

    return;
  }

  Widget get didNothaveAnAccount {
    var style = Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: Center(
        child: InkWell(
          onTap: navigateToRegisterScreen,
          child: SizedBox(
            height: 30,
            child: Text.rich(
              TextSpan(text: "Belum punya akun ?\t", children: [
                TextSpan(
                    text: "Daftar Sekarang",
                    style: style?.copyWith(
                        fontFamily: 'Proxima-Nova',
                        fontSize: 14,
                        color: AppTheme.of(context).textPrimaryColor,
                        fontWeight: FontWeight.w700)),
              ]),
              style: style?.copyWith(
                  fontFamily: 'Proxima-Nova',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.of(context).textSecondayColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
  void navigateToRegisterScreen(){
    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    return;
  }

  Widget get copyRightText {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.copyright,
            size: 14,
            color: AppTheme.of(context).textThirdColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "SILK. all right reserved.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.of(context).textThirdColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Proxima-Nova',
                  fontSize: 12,
                ),
          )
        ],
      ),
    );
  }
}
