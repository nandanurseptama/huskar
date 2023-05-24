import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class HealthToolProductCard extends StatelessWidget {
  final String imageSrc;
  final String numRating;
  final String productName;
  const HealthToolProductCard(
      {super.key,
      required this.imageSrc,
      required this.numRating,
      required this.productName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      height: 196,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: const Border.fromBorderSide(BorderSide.none),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [AppTheme.of(context).textFormFieldShadow]),
      child: Column(
        children: [
          getRating(context),
          imageTool,
          const SizedBox(
            height: 12,
          ),
          getProductName(context),
          const SizedBox(
            height: 8,
          ),
          getAvailabilityAndPrice(context),
        ],
      ),
    );
  }

  Widget getProductName(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            productName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: AppTheme.proximaNovaFontFamily,
                fontSize: 14,
                color: AppTheme.of(context).textPrimaryColor),
          ),
        )
      ],
    );
  }

  Widget getAvailabilityAndPrice(BuildContext context) {
    return Row(
      children: [
        getPrice(context),
        const SizedBox(
          width: 16,
        ),
        getAvailability(context),
      ],
    );
  }

  Widget getAvailability(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
          color: const Color(0xffB3FFCB),
          borderRadius: BorderRadius.circular(4),
          border: const Border.fromBorderSide(BorderSide.none)),
      child: Text(
        "Ready Stok",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: AppTheme.proximaNovaFontFamily,
            fontSize: 10,
            color: const Color(0xff007025)),
      ),
    );
  }

  Widget getPrice(BuildContext context) {
    return Expanded(
      child: Text(
        "Rp. 10.000",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xffFF7200),
            fontFamily: AppTheme.proximaNovaFontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget getRating(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFEA00),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          numRating,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.of(context).textThirdColor,
                fontWeight: FontWeight.w700,
                fontFamily: AppTheme.proximaNovaFontFamily,
                fontSize: 16,
              ),
        ),
      ],
    );
  }

  Widget get imageTool {
    return Image.asset(
      imageSrc,
      width: 80,
      height: 80,
    );
  }
}
