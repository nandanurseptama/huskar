import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class CloseButton extends StatelessWidget {
  final void Function() onTap;
  const CloseButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: SizedBox(
          height: 40,
          width: 40,
          child: Icon(
            Icons.close_rounded,
            size: 18,
            color: AppTheme.of(context).textPrimaryColor,
          ),
        ),
      ),
    );
  }
}
