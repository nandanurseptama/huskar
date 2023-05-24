import 'package:flutter/material.dart';

class DotOrnament extends StatelessWidget {
  final Size size;
  final int numOfDot;
  const DotOrnament(
      {super.key, this.size = const Size(43, 42), this.numOfDot = 36});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 43,
      height: 42,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: 6.19,
        runSpacing: 5.71,
        children: List.generate(numOfDot, (index) {
          return Container(
            height: 1.9,
            width: 1.9,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffffffff).withOpacity(0.2)),
          );
        }),
      ),
    );
  }
}
