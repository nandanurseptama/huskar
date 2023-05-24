import 'package:flutter/material.dart';
import 'package:huskar/cores/widgets/shadow_input_border.dart';

class AppTheme {
  static String proximaNovaFontFamily = "Proxima-Nova";
  static String gilroyFontFamily = "Gilroy";
  final bool isDark;
  const AppTheme(this.isDark);
  Color get lightPrimaryColor => const Color(0xff002060);
  Color get darkPrimaryColor => const Color(0xff002060);

  Color get primaryColor {
    return isDark ? darkPrimaryColor : lightPrimaryColor;
  }

  Color get lightTextPrimaryColor => const Color(0xff1D334F);
  Color get darkTextPrimaryColor => const Color(0xff1D334F);

  Color get lightTextSecondaryColor => const Color(0xff597393);
  Color get darkTextSecondaryColor => const Color(0xff597393);

  Color get lightTextThirdColor => const Color(0xffbebebe);
  Color get darkTextThirdColor => const Color(0xffbebebe);

  Color get textPrimaryColor {
    return lightTextPrimaryColor;
  }

  Color get textSecondayColor {
    return lightTextSecondaryColor;
  }

  Color get textThirdColor {
    return isDark ? darkTextThirdColor : lightTextThirdColor;
  }

  static AppTheme of(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return AppTheme(brightness == Brightness.dark);
  }

  ColorScheme get colorScheme {
    return ColorScheme.fromSeed(
      seedColor: isDark ? darkPrimaryColor : lightPrimaryColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }

  ThemeData get themeData {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: !isDark ? Colors.white : null,
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontStyle: FontStyle.normal,
            color: colorScheme.primary,
          ),
          hintStyle: TextStyle(
              fontFamily: "Proxima-Nova",
              fontWeight: FontWeight.w300,
              fontSize: 12,
              fontStyle: FontStyle.normal,
              color: colorScheme.outline),
          border: ShadowInputBorder(
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            shadow: textFormFieldShadow,
          ),
          enabledBorder: ShadowInputBorder(
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            shadow: textFormFieldShadow,
          ),
          focusedBorder: ShadowInputBorder(
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            shadow: textFormFieldShadow,
          ),
          errorBorder: ShadowInputBorder(
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.error, width: 0.8)),
            shadow: textFormFieldShadow,
          ),
          focusedErrorBorder: ShadowInputBorder(
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorScheme.error, width: 1)),
            shadow: textFormFieldShadow,
          ),
          disabledBorder: ShadowInputBorder(
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            shadow: textFormFieldShadow,
          ),
        ),
        textTheme: textTheme,
        primaryTextTheme: textTheme);
  }

  TextTheme get textTheme {
    var baseTextTheme = const TextTheme();
    return baseTextTheme.copyWith(
      headlineLarge: baseTextTheme.headlineLarge
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      headlineMedium: baseTextTheme.headlineMedium
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      headlineSmall: baseTextTheme.headlineSmall
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      displayLarge: baseTextTheme.displayLarge
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      displayMedium: baseTextTheme.displayMedium
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      displaySmall: baseTextTheme.displaySmall
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      titleLarge: baseTextTheme.titleLarge
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      titleMedium: baseTextTheme.titleMedium
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      titleSmall: baseTextTheme.titleSmall
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      bodyLarge: baseTextTheme.bodyLarge
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      bodyMedium: baseTextTheme.bodyMedium
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      bodySmall: baseTextTheme.bodySmall
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      labelLarge: baseTextTheme.labelLarge
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      labelMedium: baseTextTheme.labelMedium
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
      labelSmall: baseTextTheme.labelSmall
          ?.copyWith(color: textPrimaryColor, fontFamily: "Gilroy"),
    );
  }

  BoxShadow get textFormFieldShadowLight {
    return BoxShadow(
        color: const Color(0xffbebebe).withOpacity(0.4),
        offset: const Offset(0, 0),
        spreadRadius: 0,
        blurRadius: 24,
        blurStyle: BlurStyle.outer);
  }

  BoxShadow get textFormFieldShadow {
    return textFormFieldShadowLight;
  }

  BoxShadow get buttonShadowPrimaryLight {
    return BoxShadow(
        color: primaryColor.withOpacity(0.34),
        offset: Offset.zero,
        spreadRadius: 0,
        blurRadius: 24,
        blurStyle: BlurStyle.outer);
  }

  BoxShadow get buttonShadowPrimary {
    return buttonShadowPrimaryLight;
  }
}
