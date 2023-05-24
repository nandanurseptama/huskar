import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/icons.dart';
import 'package:huskar/cores/widgets/shadow_input_border.dart';

class SearchFieldWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const SearchFieldWidget({super.key, required this.constraints});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constraints.maxWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          buttonFilter,
          const SizedBox(
            width: 30,
          ),
          searchField,
        ],
      ),
    );
  }

  Widget get buttonFilter {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          AppTheme.of(context).textFormFieldShadow,
        ],
      ),
      child: Icon(
        HuskarIcon.filterSetting,
        color: AppTheme.of(context).textPrimaryColor,
        size: 16,
      ),
    );
  }

  Widget get searchField {
    var borderSide = ShadowInputBorder(
        child: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        shadow: AppTheme.of(context).textFormFieldShadow);
    return Expanded(
      child: SizedBox(
        height: 42,
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Search",
              border: borderSide,
              enabledBorder: borderSide,
              focusedBorder: borderSide,
              suffixIcon: Icon(
                Icons.search,
                color: AppTheme.of(context).textPrimaryColor,
              )),
        ),
      ),
    );
  }
}
