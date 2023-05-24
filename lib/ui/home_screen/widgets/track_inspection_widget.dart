import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/constants/assets_path.dart';

class TrackInspectionWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const TrackInspectionWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117,
      width: constraints.maxWidth,
      child: Stack(
        children: [getContainer(context), imageCovid],
      ),
    );
  }

  Widget get imageCovid {
    return Positioned(
      left: 40,
      top: 0,
      height: 67,
      width: 80,
      child: Image.asset(
        AssetPath.homeKeyAsset,
      ),
    );
  }

  Widget getContainer(BuildContext context) {
    return Positioned(
      top: 13,
      left: 20,
      right: 20,
      height: 104,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: AppTheme.of(context).textFormFieldShadow.color,
                    offset: const Offset(0, 14),
                    blurRadius: 24,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer)
              ]),
          padding: const EdgeInsets.only(
            top: 8,
            right: 20
          ),
          alignment: Alignment.topRight,
          child: SizedBox(
            width: constraints.maxWidth / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Track Pemeriksaan",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.of(context).textPrimaryColor,
                      fontSize: 18),
                ),
                SizedBox(
                  width: (constraints.maxWidth - 30) / 2,
                  child: Text(
                    "Kamu dapat mengecek progress pemeriksaanmu disini",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppTheme.of(context).textSecondayColor,
                          fontSize: 12,
                          fontFamily: AppTheme.proximaNovaFontFamily,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Track",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.of(context).textPrimaryColor,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: AppTheme.of(context).textPrimaryColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
