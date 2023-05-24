import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/constants/assets_path.dart';

class SpesicalServiceWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const SpesicalServiceWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 163,
      width: constraints.maxWidth,
      child: Stack(
        children: [getContainer(context), imageCovid],
      ),
    );
  }

  Widget get imageCovid {
    return Positioned(
      right: 40,
      top: 0,
      height: 120,
      width: 120,
      child: Image.asset(
        AssetPath.homeCovidBottlesAsset,
      ),
    );
  }

  Widget getContainer(BuildContext context) {
    return Positioned(
      top: 26,
      left: 20,
      right: 20,
      height: 127,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.of(context).textFormFieldShadow.color,
                  offset: const Offset(0, 16),
                  blurRadius: 24,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.outer
                )
              ]
            ),
          padding: const EdgeInsets.only(
            top: 28,
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Layanan Khusus",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.of(context).textPrimaryColor,
                    fontSize: 18),
              ),
              SizedBox(
                width: (constraints.maxWidth - 30) / 2,
                child: Text(
                  "Tes Covid 19, Cegah Corona Sedini Mungkin",
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
                    "Daftar Tes",
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
        );
      }),
    );
  }
}
