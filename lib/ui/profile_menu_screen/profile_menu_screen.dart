import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/constants/assets_path.dart';
import 'package:huskar/ui/profile_edit_screen/profile_edit_screen.dart';
import 'package:huskar/ui/profile_menu_screen/widgets/faq_and_policy.dart';
import 'package:huskar/ui/profile_menu_screen/widgets/info_widget.dart';
import 'package:huskar/ui/profile_menu_screen/widgets/name_and_profile_picture.dart';
import 'package:huskar/ui/profile_menu_screen/widgets/profile_menu_list.dart';
import 'widgets/close_button.dart' as cb;

class ProfileMenuScreen extends StatefulWidget {
  final void Function() onLogout;
  const ProfileMenuScreen({super.key, required this.onLogout});

  @override
  State<ProfileMenuScreen> createState() => _ProfileMenuScreenState();
}

class _ProfileMenuScreenState extends State<ProfileMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.1),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: constraints,
              child: Row(
                children: [
                  Container(
                      width: 55,
                      height: constraints.maxHeight,
                      alignment: Alignment.topLeft,
                      color: const Color(0xff002060).withOpacity(0.6),
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 40,
                      ),
                      child: cb.CloseButton(
                        onTap: () {
                          Navigator.pop(context);
                          return;
                        },
                      )),
                  Container(
                    width: constraints.maxWidth - 55,
                    height: constraints.maxHeight,
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 40,
                      bottom: 86,
                    ),
                    child: rightSide(constraints.copyWith(
                        maxWidth: constraints.maxWidth - 55)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget rightSide(BoxConstraints constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 122,
        ),
        profilePictureAndName(
            constraints.copyWith(maxWidth: constraints.maxWidth - 80)),
        const SizedBox(
          height: 36,
        ),
        getProfileMenuList(
            constraints.copyWith(maxWidth: constraints.maxWidth - 80)),
        const SizedBox(
          height: 25,
        ),
        getLogoutButton(),
        const SizedBox(
          height: 80,
        ),
        getProfileInfoWidget(
            constraints.copyWith(maxWidth: constraints.maxWidth - 80)),
        const Expanded(
          child: SizedBox(),
        ),
        getFaqAndPolicyWidget(
            constraints.copyWith(maxWidth: constraints.maxWidth - 80)),
      ],
    );
  }

  Widget profilePictureAndName(BoxConstraints constraints) {
    return NameAndProfilePicture(
      firstName: "Angga",
      lastName: "Praja",
      profilePictureUrl: AssetPath.exampleProfilePictureUrl,
      constraints: constraints,
    );
  }

  Widget getProfileMenuList(BoxConstraints constraints) {
    return ProfileMenuList(
        constraints: constraints, onTap: navigateToProfileEditScreen);
  }

  void navigateToProfileEditScreen(String value) {
    // pop this screen
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, ProfileEditScreen.routeName,
        arguments: {"initialSubMenu": value});
    return;
  }

  Widget getLogoutButton() {
    return FilledButton(
      onPressed: onLogout,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xffEB0004)),
          fixedSize: MaterialStatePropertyAll(
            Size(131, 28),
          ),
          maximumSize: MaterialStatePropertyAll(
            Size(131, 28),
          ),
          minimumSize: MaterialStatePropertyAll(
            Size(131, 28),
          ),
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          alignment: Alignment.center),
      child: Text(
        "Logout",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: AppTheme.proximaNovaFontFamily,
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  void onLogout() {
    widget.onLogout();
    return;
  }

  Widget getProfileInfoWidget(BoxConstraints constraints) {
    return ProfileInfoWidget(constraints: constraints);
  }

  Widget getFaqAndPolicyWidget(BoxConstraints constraints) {
    return FaqAndPolicyWidget(constraints: constraints);
  }
}
