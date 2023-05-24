import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/widgets/dot_ornament.dart';

class FooterWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const FooterWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth,
      height: 107,
      color: AppTheme.of(context).primaryColor,
      child: Stack(
        children: [
          Positioned(
            left: -41,
            top: -15,
            child: getCircleOrnamen1(context),
          ),
          Positioned(
            left: -22,
            top: 38,
            child: getCircleOrnamen2(context),
          ),
          dotOrnamen,
          Positioned(
            left: 22,
            top: 34,
            width: (constraints.maxWidth - 68) / 2,
            child: getTitleText(context),
          ),
          Positioned(
            right: 17,
            top: 38,
            child: getSubtitle(context),
          )
        ],
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
      height: 103,
      width: 103,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppTheme.of(context).primaryColor),
    );
  }

  Widget get dotOrnamen {
    return const Positioned(top: 18, right: 86, child: DotOrnament());
  }

  Widget getTitleText(BuildContext context) {
    return SizedBox(
      child: Text(
        "Ingin mendapat update dari kami ?",
        maxLines: 2,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16),
      ),
    );
  }

  Widget getSubtitle(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 61,
            child: Text(
              "Dapatkan Notifikasi",
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: AppTheme.proximaNovaFontFamily,
                  fontSize: 14),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Icon(
            Icons.arrow_forward,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 16,
          )
        ],
      ),
    );
  }
}
