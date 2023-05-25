import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/constants/assets_path.dart';
import 'package:huskar/ui/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/auth/register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    subtitle,
                    image,
                    _verticalPadding(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: constraints.copyWith(
                                maxWidth:
                                    (constraints.maxWidth - (35 / 2) - 40) / 2,
                              ),
                              child: getField(
                                  labelLeft: "Nama Depan", hint: "Cth : John"),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            ConstrainedBox(
                              constraints: constraints.copyWith(
                                maxWidth:
                                    (constraints.maxWidth - (35 / 2) - 40) / 2,
                              ),
                              child: getField(
                                  labelLeft: "Nama Belakang",
                                  hint: "Cth : Doe"),
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _verticalPadding(
                      child: getField(
                          labelLeft: "No. KTP", hint: "Masukkan No. KTP anda"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _verticalPadding(
                        child: getField(
                            labelLeft: "Email", hint: "Masukkan email anda")),
                     const SizedBox(
                      height: 40,
                    ),
                    _verticalPadding(
                        child: getField(
                            labelLeft: "No. Telpon", hint: "Masukkan No. Telpon anda")),
                    const SizedBox(
                      height: 40,
                    ),
                    _verticalPadding(
                      child: getField(
                          labelLeft: "Password",
                          obSecure: true,
                          suffix: Icon(
                            Icons.remove_red_eye,
                            color: AppTheme.of(context).textPrimaryColor,
                          ),
                          hint: "Masukkan password anda"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _verticalPadding(
                      child: getField(
                        obSecure: true,
                        labelLeft: "Konfirmasi Password",
                        hint: "Konfirmasi password anda",
                        suffix: Icon(
                          Icons.remove_red_eye,
                          color: AppTheme.of(context).textPrimaryColor,
                        ),
                      ),
                    ),
                    buttonLogin,
                    didNothaveAnAccount,
                    copyRightText
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
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
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
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
                padding: const EdgeInsets.only(bottom: 16),
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
              child: TextFormField(
                maxLines: 1,
                obscureText: obSecure,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 24, right: 24, top: 13),
                    hintText: hint,
                    suffixIcon: suffix),
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
            onPressed: () {},
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                ),
                const SizedBox(width: 40, child: Icon(Icons.arrow_forward)),
              ],
            )),
      ),
    );
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
          onTap: navigateToLoginScreen,
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
  void navigateToLoginScreen(){
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
