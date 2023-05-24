import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/icons.dart';

class ProfileInfoWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const ProfileInfoWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          followText(context),
          const SizedBox(
            width: 10,
          ),
          iconButton(icon: HuskarIcon.facebook, context: context),
          iconButton(icon: HuskarIcon.instagram, context: context),
          iconButton(icon: HuskarIcon.twitterCircled, context: context),
        ],
      ),
    );
  }

  Widget followText(BuildContext context) {
    return Text(
      "Ikuti kami di",
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppTheme.of(context).textPrimaryColor,
          ),
    );
  }

  Widget iconButton({
    required IconData icon,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        return;
      },
      child: SizedBox(
        height: 20,
        width: 20,
        child: Icon(
          icon,
          size: 14,
        ),
      ),
    );
  }
}
