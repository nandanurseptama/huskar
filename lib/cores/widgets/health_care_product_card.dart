import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class HealthCareProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String placeName;
  final String location;
  final String placeImageSrc;
  const HealthCareProductCard(
      {super.key,
      required this.placeName,
      required this.title,
      required this.location,
      required this.price,
      required this.placeImageSrc});

  @override
  State<HealthCareProductCard> createState() => _HealthCareProductCardState();
}

class _HealthCareProductCardState extends State<HealthCareProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 149,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: const Border.fromBorderSide(BorderSide.none),
        boxShadow: [
          AppTheme.of(context).textFormFieldShadow,
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15, left: 21),
              child: leftSide,
            ),
          ),
          rightSide
        ],
      ),
    );
  }

  Widget get rightSide {
    return AspectRatio(
      aspectRatio: 0.79865771812,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          widget.placeImageSrc,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget get leftSide {
    var proximaStyle14 = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontFamily: AppTheme.proximaNovaFontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: AppTheme.of(context).textPrimaryColor,
      );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          widget.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: proximaStyle14,
        ),
        Text(
          widget.price,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: proximaStyle14?.copyWith(
              color: const Color(0xffFF7200),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.local_hospital,
                  color: AppTheme.of(context).textPrimaryColor,
                  size: 14,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.placeName,
                  maxLines: 1,
                  style: proximaStyle14?.copyWith(
                    color: const Color(0xff6A6A6A),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.place,
                  color: AppTheme.of(context).textPrimaryColor,
                  size: 14,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.location,
                  maxLines: 1,
                  style: proximaStyle14?.copyWith(
                    color: const Color(0xffBEBEBE),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
