import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/ui/profile_menu_screen/profile_menu_screen.dart';

AppBar getSimpleAppbar({
  required BuildContext context,
  required void Function() onLogout,
}) {
  Widget getCartButton(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart,
          color: AppTheme.of(context).textPrimaryColor,
        ));
  }

  Widget getNotificationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {},
          child: SizedBox(
            height: 42,
            width: 42,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                  child: Icon(Icons.notifications),
                ),
                Positioned(
                  top: 8,
                  right: 9,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.fromBorderSide(
                            BorderSide(width: 2, color: Colors.white))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  return AppBar(
    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    shadowColor: null,
    leading: IconButton(
      onPressed: () {
        showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) {
              return ProfileMenuScreen(onLogout: onLogout,);
            });
        return;
      },
      icon: Icon(
        Icons.menu,
        color: AppTheme.of(context).textPrimaryColor,
      ),
    ),
    actions: [getCartButton(context), getNotificationButton(context)],
  );
}
