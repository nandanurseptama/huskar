import 'package:flutter/material.dart';

class ProfileMenuList extends StatelessWidget {
  final BoxConstraints constraints;
  final ValueSetter<String> onTap;
  const ProfileMenuList(
      {super.key, required this.constraints, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileMenuItem(context: context, itemName: "Profile Saya"),
          profileMenuItem(context: context, itemName: "Pengaturan"),
        ],
      ),
    );
  }

  Widget profileMenuItem(
      {required BuildContext context, required String itemName}) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () {
          onTap(itemName);
          return;
        },
        child: Container(
          width: 145,
          height: 34,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                itemName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff9A9A9A),
                    fontSize: 12),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Color(0xff828282),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
