import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../state/bloc/theme/model/theme_data.dart';
import 'colors.dart';

TextStyle bodyTextStyle(ThemeItemData theme) => GoogleFonts.poppins(
      color: theme.textColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );

TextStyle bodyTextLightStyle(ThemeItemData theme) =>
    bodyTextStyle(theme).copyWith(
      color: theme.backgroundColor,
    );

TextStyle bodyBigTextStyle(ThemeItemData theme) => GoogleFonts.poppins(
      color: theme.textColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

TextStyle bodyBigTextLightStyle(ThemeItemData theme) =>
    bodyBigTextStyle(theme).copyWith(
      color: theme.backgroundColor,
    );

TextStyle titleTextStyle(ThemeItemData theme) => GoogleFonts.poppins(
      color: theme.textColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );

TextStyle titleLightTextStyle(ThemeItemData theme) => GoogleFonts.poppins(
      color: theme.backgroundColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );

TextStyle subTitleTextStyle(ThemeItemData theme) => GoogleFonts.poppins(
      color: theme.textColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

TextStyle subTitleLightTextStyle(ThemeItemData theme) => GoogleFonts.poppins(
      color: theme.backgroundColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

final TextStyle cardTextStyle = GoogleFonts.poppins(
  color: black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final TextStyle deckTextStyle = GoogleFonts.poppins(
  color: white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const OutlinedBorder buttonShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)));

const OutlinedBorder cardShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));

ButtonStyle primaryButtonStyle(ThemeItemData theme) => ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      textStyle: subTitleTextStyle(theme),
      onPrimary: theme.textColor,
      primary: theme.backgroundColor,
      shape: buttonShape,
      surfaceTintColor: theme.textColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle primaryDarkButtonStyle(ThemeItemData theme) =>
    ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      textStyle: subTitleTextStyle(theme),
      onPrimary: theme.backgroundColor,
      primary: theme.textColor,
      shape: buttonShape,
      surfaceTintColor: theme.backgroundColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle lightButtonStyle(ThemeItemData theme) => ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      textStyle: subTitleTextStyle(theme),
      onPrimary: theme.textColor,
      primary: theme.backgroundColor,
      shape: buttonShape,
      surfaceTintColor: theme.backgroundColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle darkButtonStyle(ThemeItemData theme) => ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      textStyle: subTitleLightTextStyle(theme),
      onPrimary: theme.textColor,
      primary: theme.backgroundColor,
      shape: buttonShape,
      surfaceTintColor: theme.backgroundColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle lightOutlineButtonStyle(ThemeItemData theme) =>
    OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      side: BorderSide(color: theme.textColor, width: 3),
      textStyle: subTitleLightTextStyle(theme),
      primary: theme.textColor,
      shape: buttonShape,
      surfaceTintColor: theme.textColor,
      backgroundColor: theme.backgroundColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle greyOutlineButtonStyle(ThemeItemData theme) =>
    OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      side: const BorderSide(color: grey, width: 3),
      textStyle: subTitleLightTextStyle(theme).copyWith(color: grey),
      primary: grey,
      shape: buttonShape,
      surfaceTintColor: grey,
      backgroundColor: theme.backgroundColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle lightOutlineCompressedButtonStyle(ThemeItemData theme) =>
    OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      side: BorderSide(color: theme.textColor, width: 3),
      textStyle: subTitleLightTextStyle(theme),
      primary: theme.textColor,
      shape: buttonShape,
      surfaceTintColor: theme.textColor,
      backgroundColor: theme.backgroundColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle darkOutlineButtonStyle(ThemeItemData theme) =>
    OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      side: BorderSide(color: theme.backgroundColor, width: 3),
      textStyle: subTitleTextStyle(theme),
      primary: theme.backgroundColor,
      shape: buttonShape,
      surfaceTintColor: theme.backgroundColor,
      backgroundColor: theme.textColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle secondaryButtonStyle(ThemeItemData theme) =>
    ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      textStyle: subTitleTextStyle(theme),
      onPrimary: theme.backgroundColor,
      primary: theme.secondaryColor,
      shape: buttonShape,
      surfaceTintColor: theme.textColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle accentButtonStyle(ThemeItemData theme) => ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      textStyle: subTitleTextStyle(theme),
      onPrimary: theme.textColor,
      primary: theme.accentColor,
      shape: buttonShape,
      surfaceTintColor: theme.backgroundColor,
      splashFactory: InkSparkle.splashFactory,
    );

ButtonStyle premiumButtonStyle(ThemeItemData theme) => ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      textStyle: cardTextStyle,
      onPrimary: white,
      primary: grey,
      shape: buttonShape,
      surfaceTintColor: theme.darkColor,
      splashFactory: InkSparkle.splashFactory,
    );

ThemeData getLightTheme(ThemeItemData theme) {
  return ThemeData.light().copyWith(
    backgroundColor: theme.backgroundColor,
    brightness: Brightness.light,
    primaryColor: theme.accentColor,
    colorScheme: ColorScheme.light(
        primary: theme.accentColor, secondary: theme.secondaryColor),
    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
            color: theme.textColor, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: theme.backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)))),
    textTheme: Typography.material2021().black.copyWith(
        headline2: TextStyle(
          color: theme.textColor,
        ),
        headline5: TextStyle(
          color: theme.textColor,
        )),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          theme.textColor,
        ),
      ),
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: primaryDarkButtonStyle(theme)),
    outlinedButtonTheme:
        OutlinedButtonThemeData(style: lightOutlineButtonStyle(theme)),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: theme.accentColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    iconTheme: IconThemeData(color: theme.textColor, size: 30),
    sliderTheme: SliderThemeData(
      activeTrackColor: theme.accentColor,
      activeTickMarkColor: theme.accentColor,
      trackHeight: 10.0,
      overlayColor: theme.accentColor.withOpacity(.5),
      thumbColor: theme.accentColor,
      inactiveTrackColor: theme.accentColor.withOpacity(.5),
      inactiveTickMarkColor: theme.accentColor.withOpacity(.5),
    ),
    scaffoldBackgroundColor: theme.backgroundColor,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        color: Colors.transparent,
        actionsIconTheme: IconThemeData(color: theme.textColor)),
  );
}

ThemeData getDarkTheme(ThemeItemData theme) {
  return ThemeData.dark().copyWith(
    backgroundColor: theme.backgroundColor,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        primary: theme.accentColor, secondary: theme.secondaryColor),
    primaryColor: theme.accentColor,
    dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
            color: theme.textColor, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: theme.backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)))),
    textTheme: Typography.material2021().white.copyWith(
        headline2: TextStyle(
          color: theme.textColor,
        ),
        headline5: TextStyle(
          color: theme.textColor,
        )),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(theme.textColor)),
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: primaryDarkButtonStyle(theme)),
    outlinedButtonTheme:
        OutlinedButtonThemeData(style: lightOutlineButtonStyle(theme)),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: theme.accentColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    iconTheme: IconThemeData(color: theme.textColor, size: 30),
    sliderTheme: SliderThemeData(
      activeTrackColor: theme.accentColor,
      activeTickMarkColor: theme.accentColor,
      trackHeight: 10.0,
      overlayColor: theme.accentColor.withOpacity(.5),
      thumbColor: theme.accentColor,
      inactiveTrackColor: theme.accentColor.withOpacity(.5),
      inactiveTickMarkColor: theme.accentColor.withOpacity(.5),
    ),
    scaffoldBackgroundColor: theme.backgroundColor,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        color: Colors.transparent,
        actionsIconTheme: IconThemeData(color: theme.textColor)),
  );
}

ThemeData getMainTheme(ThemeItemData theme) {
  if (theme.brightness == Brightness.light) {
    return getLightTheme(theme);
  } else {
    return getDarkTheme(theme);
  }
}
