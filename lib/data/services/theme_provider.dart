import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
        )),
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: const ColorScheme.light(
        secondary: AppColors.blackColor,
        primary: AppColors.textFormFieldBgColor),
    iconTheme: const IconThemeData(color: AppColors.blackColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFormFieldBgColor,
      filled: true,
      hintStyle: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ),
    ),
    primaryIconTheme: IconThemeData(
      size: 30.sp,
      color: AppColors.greyColor,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.green,
    ),
    textTheme: TextTheme(
      button: const TextStyle(color: Colors.orange),
      bodyText1: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ),
      bodyText2: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.searchIconColor,
      ),
      headline1: GoogleFonts.pacifico(
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.exploreTextColor,
      ),
      headline2: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      headline3: GoogleFonts.poppins(
        fontSize: 20.sp,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.greyColor,
        )),
    scaffoldBackgroundColor: AppColors.blackColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFormFieldBgColor,
      filled: true,
      hintStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFF2F4F7)),
    ),
    primaryIconTheme: IconThemeData(
      size: 30.sp,
      color: AppColors.greyColor,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blueGrey,
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
    colorScheme: const ColorScheme.dark(
      secondary: AppColors.whiteColor,
      primary: AppColors.greyColor,
    ),
    textTheme: TextTheme(
      button: const TextStyle(
        color: AppColors.greyColor,
      ),
      bodyText1: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFF2F4F7)),
      bodyText2: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
      ),
      headline1: GoogleFonts.pacifico(
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.greyColor,
      ),
      headline2: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.greyColor,
      ),
      headline3: GoogleFonts.poppins(
        fontSize: 20.sp,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
