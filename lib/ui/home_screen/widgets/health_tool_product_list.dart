import 'package:flutter/material.dart';
import 'package:huskar/cores/constants/assets_path.dart';
import 'package:huskar/cores/widgets/health_tool_product_card.dart';

class HealthToolProductList extends StatefulWidget {
  final BoxConstraints constraints;
  const HealthToolProductList({super.key, required this.constraints});

  @override
  State<HealthToolProductList> createState() => _HealthToolProductListState();
}

class _HealthToolProductListState extends State<HealthToolProductList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constraints.maxWidth,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(10, (index) {
            return exampleItem;
          }),
        ),
      ),
    );
  }

  Widget get exampleItem {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: HealthToolProductCard(
        imageSrc: AssetPath.healthToolProductAsset,
        numRating: "5",
        productName: "Suntik Steril",
      ),
    );
  }
}
