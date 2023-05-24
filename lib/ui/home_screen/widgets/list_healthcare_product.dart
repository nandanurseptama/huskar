import 'package:flutter/material.dart';
import 'package:huskar/cores/constants/assets_path.dart';
import 'package:huskar/cores/icons.dart';
import 'package:huskar/cores/widgets/health_care_product_card.dart';

class ListHelathCareProduct extends StatefulWidget {
  final BoxConstraints constraints;
  const ListHelathCareProduct({super.key, required this.constraints});

  @override
  State<ListHelathCareProduct> createState() => _ListHelathCareProductState();
}

class _ListHelathCareProductState extends State<ListHelathCareProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constraints.maxWidth,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...healthCareProductCard(),
              loadMore,
            ],
          );
        },
      ),
    );
  }

  List<Widget> healthCareProductCard() {
    return List.generate(3, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: HealthCareProductCard(
            title: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja",
            placeName: "Lenmarc Surabaya",
            location: "Dukuh Pakis, Surabaya",
            price: "Rp. 1.400.000",
            placeImageSrc: AssetPath.hospitalDummyAsset),
      );
    });
  }

  Widget get loadMore {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          width: 16,
          height: 16,
          child: Icon(HuskarIcon.iosLoading, color: Color(0xffBEBEBE), size: 16,),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          "Tampilkan Lebih Banyak",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xffBEBEBE),
                fontSize: 14,
              ),
        )
      ],
    );
  }
}
