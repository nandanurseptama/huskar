import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/constants/assets_path.dart';
import 'package:huskar/cores/widgets/dot_ornament.dart';
import 'package:huskar/ui/profile_menu_screen/widgets/name_and_profile_picture.dart';

class MembershipCard extends StatelessWidget {
  final BoxConstraints constraints;
  const MembershipCard({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 159,
        width: constraints.maxWidth,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: const Border.fromBorderSide(BorderSide.none)),
        child: Stack(
          fit: StackFit.loose,
          children: [
            background(context),
            Positioned(
              top: 22,
              right: -78,
              child: getCircleOrnamen1(context),
            ),
            Positioned(
              bottom: -17,
              right: -17,
              child: getCircleOrnamen2(context),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: bottomOrnamen(context),
            ),
            Positioned(
              bottom: 42.6,
              right: 23.7,
              child: dotOrnamen(),
            ),
            Positioned(
              top: 37,
              left: 25,
              child: name(context),
            )
          ],
        ),
      ),
    );
  }

  Widget background(BuildContext context) {
    return Container(
      height: 159,
      width: constraints.maxWidth,
      decoration: BoxDecoration(
          color: AppTheme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget name(BuildContext context) {
    return NameAndProfilePicture(
        firstName: "Angga",
        lastName: "Praja",
        lastNameColor: Theme.of(context).colorScheme.onPrimary,
        firstNameColor: Theme.of(context).colorScheme.onPrimary,
        profilePictureUrl: AssetPath.exampleProfilePictureUrl,
        constraints: constraints);
  }

  Widget bottomOrnamen(BuildContext context) {
    return Container(
      height: 48,
      width: constraints.maxWidth,
      decoration: const BoxDecoration(
        color: Color(0xff1A3E78),
        border: Border.fromBorderSide(BorderSide.none),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi",
        maxLines: 2,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 12,
          fontFamily: AppTheme.proximaNovaFontFamily
        ),
      ),
    );
  }

  Widget getCircleOrnamen1(BuildContext context) {
    return Container(
      height: 181,
      width: 181,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xffD9C6B3).withOpacity(0.1),
      ),
    );
  }

  Widget getCircleOrnamen2(BuildContext context) {
    return Container(
      height: 104,
      width: 104,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppTheme.of(context).primaryColor),
    );
  }

  Widget dotOrnamen() {
    return const DotOrnament();
  }
}
