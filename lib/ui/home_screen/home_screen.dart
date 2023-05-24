import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/widgets/footer_widget.dart';
import 'package:huskar/cores/widgets/simple_appbar.dart';
import 'package:huskar/ui/home_screen/widgets/health_service_type_switcher.dart';
import 'package:huskar/ui/home_screen/widgets/health_tool_product_list.dart';
import 'package:huskar/ui/home_screen/widgets/list_healthcare_product.dart';
import 'package:huskar/ui/home_screen/widgets/product_type_filter.dart';
import 'widgets/search_field_widget.dart';
import 'package:huskar/ui/home_screen/widgets/slider_home_screen.dart';
import 'package:huskar/ui/home_screen/widgets/special_service_widget.dart';
import 'package:huskar/ui/home_screen/widgets/track_inspection_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> _selectedHealthCareType = ValueNotifier("Satuan");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getSimpleAppbar(context: context),
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: SingleChildScrollView(
            child: Column(
              children: [
                getSliderHome(constraints),
                const SizedBox(
                  height: 20,
                ),
                getSpecialServicesWidget(constraints),
                const SizedBox(
                  height: 40,
                ),
                getTrackInspectionWidget(constraints),
                const SizedBox(
                  height: 40,
                ),
                getSearchField(constraints),
                const SizedBox(
                  height: 20,
                ),
                getProductTypeFilter(constraints),
                getHealthToolProductList(constraints),
                const SizedBox(
                  height: 20,
                ),
                getSelectHealthCareTitle(),
                getHealthCareSwitcher(constraints),
                getListHealthCareProduct(constraints),
                getFooter(constraints),
              ],
            ),
          ),
        );
      })),
    );
  }

  Widget getSliderHome(BoxConstraints constraints) {
    return SliderHomeScreen(constraints: constraints);
  }

  Widget getSpecialServicesWidget(BoxConstraints constraints) {
    return SpesicalServiceWidget(constraints: constraints);
  }

  Widget getTrackInspectionWidget(BoxConstraints constraints) {
    return TrackInspectionWidget(constraints: constraints);
  }

  Widget getSearchField(BoxConstraints constraints) {
    return SearchFieldWidget(constraints: constraints);
  }

  Widget getProductTypeFilter(BoxConstraints constraints) {
    return ProductTypeFilter(constraints: constraints);
  }

  Widget getHealthToolProductList(BoxConstraints constraints) {
    return HealthToolProductList(constraints: constraints);
  }

  Widget getSelectHealthCareTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Pilih Tipe Layanan Kesehatan Anda",
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.of(context).textPrimaryColor,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHealthCareSwitcher(BoxConstraints constraints) {
    return ValueListenableBuilder<String>(
        valueListenable: _selectedHealthCareType,
        builder: (context, v, _) {
          return HealthServiceTypeSwitcher(
            constraints: constraints,
            onChanged: (value) {
              setState(() {
                _selectedHealthCareType.value = value;
              });
              return;
            },
            selectedValue: v,
          );
        });
  }

  Widget getFooter(BoxConstraints constraints) {
    return FooterWidget(constraints: constraints);
  }

  Widget getListHealthCareProduct(BoxConstraints constraints) {
    return ListHelathCareProduct(constraints: constraints);
  }
}
