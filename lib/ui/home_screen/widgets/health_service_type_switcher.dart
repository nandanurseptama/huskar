import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/widgets/animated_toogle.dart';

class HealthServiceTypeSwitcher extends StatefulWidget {
  final BoxConstraints constraints;
  final String selectedValue;
  final void Function(String value) onChanged;
  const HealthServiceTypeSwitcher(
      {super.key,
      required this.constraints,
      required this.selectedValue,
      required this.onChanged});

  @override
  State<HealthServiceTypeSwitcher> createState() =>
      _HealthServiceTypeSwitcherState();
}

class _HealthServiceTypeSwitcherState extends State<HealthServiceTypeSwitcher> {
  final List<String> values = ["Satuan", "Paket Pemeriksaan", "Paket Spesial"];
  @override
  Widget build(BuildContext context) {
    return AnimatedToggle(
        values: values,
        onToggleCallback: (val) {
          return widget.onChanged(val);
        });
  }

  Widget builder() {
    return Container(
      height: 34,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [AppTheme.of(context).textFormFieldShadow]),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: listOptionText(),
    );
  }

  Widget listOptionText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: ["Satuan", "Paket Pemeriksaan"].map((e) {
        return item(e);
      }).toList(),
    );
  }

  Widget item(String text) {
    bool isSelected = widget.selectedValue == text;
    return InkWell(
      onTap: () {
        widget.onChanged(text);
        return;
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 16, top: 5, bottom: 5),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                color: const Color(0xff00D9D5),
                border: const Border.fromBorderSide(BorderSide.none),
                borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.of(context).textPrimaryColor,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                fontFamily: AppTheme.proximaNovaFontFamily,
              ),
        ),
      ),
    );
  }
}
