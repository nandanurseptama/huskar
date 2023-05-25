import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/utils/dialogs.dart';
import 'package:huskar/cores/utils/register_listener_fn.dart';
import 'package:huskar/cores/widgets/animated_toogle.dart';
import 'package:huskar/cores/widgets/footer_widget.dart';
import 'package:huskar/cores/widgets/simple_appbar.dart';
import 'package:huskar/features/auth/presentation/states/auth_state.dart';
import 'package:huskar/ui/login_screen.dart';
import 'package:huskar/ui/profile_edit_screen/widgets/edit_profile_form.dart';
import 'package:huskar/ui/profile_edit_screen/widgets/membership_card.dart';

class ProfileEditScreen extends StatefulWidget {
  final void Function() onLogout;
  static String routeName = "/profile/edit";
  final RegisterListenerFn<AuthState> registerListener;
  final String initialSubmenu;
  const ProfileEditScreen(
      {super.key,
      this.initialSubmenu = "Profile Saya",
      required this.onLogout,
      required this.registerListener});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.registerListener(authStateListener);
    });
  }

  void authStateListener(AuthState authState) {
    return authState.maybeMap<void>(
      unauthed: (value) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
      appBar: getSimpleAppbar(context: context, onLogout: widget.onLogout),
      backgroundColor: const Color(0xffF5F8FA),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: constraints,
            child: body(constraints),
          );
        }),
      ),
    );
  }

  Widget body(BoxConstraints constraints) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getProfileMenuSwitcher(constraints),
          form(constraints),
          const SizedBox(
            height: 77,
          ),
          getFooter(constraints),
        ],
      ),
    );
  }

  Widget getProfileMenuSwitcher(BoxConstraints constraints) {
    return Container(
      alignment: Alignment.center,
      constraints: constraints.copyWith(maxHeight: 76),
      child: AnimatedToggle(
          values: const ["Profile Saya", "Pengaturan"],
          onToggleCallback: (value) {}),
    );
  }

  Widget form(BoxConstraints parentConstraints) {
    var constraints =
        parentConstraints.copyWith(maxWidth: parentConstraints.maxWidth - 62);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            AppTheme.of(context).textFormFieldShadow,
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(bottom: 31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MembershipCard(constraints: constraints),
          getFormTitle(),
          formHeader(constraints),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: EditProfileForm(constraints: constraints),
          ),
        ],
      ),
    );
  }

  Widget getFormTitle() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, top: 15, bottom: 23, right: 30),
      child: Text(
        "Pilih data yang ingin ditampilkan",
        textAlign: TextAlign.left,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppTheme.of(context).textPrimaryColor),
      ),
    );
  }

  Widget formHeader(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _circleIcon(
              backgroundColor: const Color(0xff00D9D5),
              data: Icons.contact_page,
              iconColor: AppTheme.of(context).primaryColor,
              iconSize: 16),
          const SizedBox(
            width: 12,
          ),
          _personalDataText(),
          const SizedBox(
            width: 20,
          ),
          _circleIcon(
              backgroundColor: const Color(0xffEBEDF7),
              data: Icons.place,
              iconColor: const Color(0xff6A6A6A),
              iconSize: 16),
        ],
      ),
    );
  }

  Widget _personalDataText() {
    var style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: const Color(0xff333333),
        );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Data Diri",
          style: style,
        ),
        const SizedBox(
          height: 1,
        ),
        Text(
          "Data diri anda sesuai KTP",
          style: style?.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: const Color(0xffbdbdbd),
              fontFamily: AppTheme.proximaNovaFontFamily),
        ),
      ],
    );
  }

  Widget _circleIcon({
    required IconData data,
    required Color iconColor,
    required Color backgroundColor,
    required double iconSize,
  }) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Icon(
        data,
        color: iconColor,
        size: iconSize,
      ),
    );
  }

  Widget getFooter(BoxConstraints constraints) {
    return FooterWidget(constraints: constraints);
  }
}
