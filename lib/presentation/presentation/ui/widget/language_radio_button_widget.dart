import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageRadioButtonWidget extends StatefulWidget {
  const LanguageRadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<LanguageRadioButtonWidget> createState() =>
      _LanguageRadioButtonWidgetState();
}

// Default Radio Button Item
String? languageNameselected;

// Group Value for Radio Button.
int? indexSelected;

class _LanguageRadioButtonWidgetState extends State<LanguageRadioButtonWidget> {
  List<LanguageList> languauges = [
    LanguageList(index: 1, name: "Arabic"),
    LanguageList(index: 2, name: "Bahasa"),
    LanguageList(index: 3, name: "English"),
    LanguageList(index: 4, name: "French"),
    LanguageList(index: 5, name: "Spanish"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: languauges
          .map((data) => RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: AppColors.primaryColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                title: Text(
                  data.name,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.searchIconColor,
                  ),
                ),
                groupValue: indexSelected,
                value: data.index,
                onChanged: (val) {
                  setState(() {
                    languageNameselected = data.name;
                    indexSelected = data.index;
                  });
                },
              ))
          .toList(),
    );
  }
}

class LanguageList {
  String name;
  int index;
  LanguageList({required this.name, required this.index});
}
