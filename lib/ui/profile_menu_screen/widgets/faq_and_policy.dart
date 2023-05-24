import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class FaqAndPolicyWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const FaqAndPolicyWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          followText(context: context, text: "FAQ"),
          const SizedBox(
            width: 40,
          ),
          followText(context: context, text: "Terms and Conditions"),
        ],
      ),
    );
  }

  Widget followText({required BuildContext context, required String text}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontFamily: AppTheme.proximaNovaFontFamily,
            color: AppTheme.of(context).textThirdColor,
          ),
    );
  }
}
