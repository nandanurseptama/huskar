import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class NameAndProfilePicture extends StatelessWidget {
  final BoxConstraints constraints;
  final String firstName;
  final String lastName;
  final String profilePictureUrl;
  final Color? firstNameColor;
  final Color? lastNameColor;
  const NameAndProfilePicture(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.profilePictureUrl,
      required this.constraints,
      this.lastNameColor,
      this.firstNameColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      height: 50,
      child: Row(
        children: [
          profilePicture(context),
          const SizedBox(
            width: 16,
          ),
          getNameAndMembershipInfo(context),
        ],
      ),
    );
  }

  Widget getNameAndMembershipInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          getName(context),
          const SizedBox(
            height: 2,
          ),
          getMemberShipInfo(context)
        ],
      ),
    );
  }

  Widget getName(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: firstNameColor ?? AppTheme.of(context).textPrimaryColor);
    return Text.rich(
      TextSpan(text: "$firstName ", children: [
        TextSpan(
            text: lastName,
            style: style?.copyWith(
              fontWeight: FontWeight.w400,
              color: lastNameColor ??AppTheme.of(context).textPrimaryColor
            ))
      ]),
      style: style,
    );
  }

  Widget getMemberShipInfo(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        fontFamily: AppTheme.proximaNovaFontFamily,
        color: AppTheme.of(context).textSecondayColor);
    return Text(
      "Membership BBLK",
      style: style,
    );
  }

  Widget profilePicture(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffEFF1FB),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Image.network(
          profilePictureUrl,
          errorBuilder: (context, error, stackTrace) {
            return profilePictureError(context);
          },
          loadingBuilder: (context, child, loadingProgress) {
            debugPrint("loadingProgress $loadingProgress");
            return Container(
              height: 36,
              width: 36,
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.center,
              child: loadingProgress == null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: child,
                    )
                  : profilePictureLoading(context),
            );
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return child;
          },
          height: 36,
          width: 36,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget profilePictureError(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.center,
      child: Icon(
        Icons.person,
        color: AppTheme.of(context).primaryColor,
      ),
    );
  }

  Widget profilePictureLoading(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: AppTheme.of(context).primaryColor,
      ),
    );
  }
}
