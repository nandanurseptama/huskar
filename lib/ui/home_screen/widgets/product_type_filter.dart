import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class ProductTypeFilter extends StatefulWidget {
  final BoxConstraints constraints;
  final ProductTypeEnum selectedType;
  const ProductTypeFilter(
      {super.key,
      required this.constraints,
      this.selectedType = ProductTypeEnum.all});

  @override
  State<ProductTypeFilter> createState() => _ProductTypeFilterState();
}

class _ProductTypeFilterState extends State<ProductTypeFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constraints.maxWidth,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 16),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(ProductTypeEnum.values.length, (index) {
            return filter(ProductTypeEnum.values[index]);
          }),
        ),
      ),
    );
  }

  Widget filter(ProductTypeEnum type) {
    var isSelected = type == widget.selectedType;
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 19),
      decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.of(context).primaryColor
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.of(context).textFormFieldShadow.color.withOpacity(0.24),
              spreadRadius: 0,
              blurRadius: 16,
              offset: const Offset(0, 10)
            ),
          ]),
      child: Text(
        type.label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : AppTheme.of(context).textPrimaryColor,
            ),
      ),
    );
  }
}

enum ProductTypeEnum {
  all("Semua Produk"),
  healthCare("Layanan Kesehatan"),
  healthTool("Alat Kesehatan"),
  doctor("Dokter"),
  medicines("Obat-obatan"),
  hospital("Rumah Sakit");

  const ProductTypeEnum(this.label);
  final String label;
}
