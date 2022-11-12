import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegionCheckBoxWidget extends StatefulWidget {
  const RegionCheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<RegionCheckBoxWidget> createState() => _RegionCheckBoxWidgetState();
}

bool isContinentCheked = false;

//Declaring empty list to accept list of categories selected
List<String> continentCheckList = [];

class _RegionCheckBoxWidgetState extends State<RegionCheckBoxWidget> {
  List<Map> continentList = [
    {"name": "Africa", "isChecked": false},
    {"name": "Antarctica", "isChecked": false},
    {"name": "Asia", "isChecked": false},
    {"name": "Europe", "isChecked": false},
    {"name": "NorthAmerica", "isChecked": false},
    {"name": "Oceania", "isChecked": false},
    {"name": "SouthAmerica", "isChecked": false},
  ];
  @override
  Widget build(BuildContext context) {
    return // The checkboxes will be here
        Column(
            children: continentList.map((value) {
      return CheckboxListTile(
          activeColor: AppColors.primaryColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          controlAffinity: ListTileControlAffinity.trailing,
          value: value["isChecked"],
          title: Text(
            value["name"],
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.searchIconColor,
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              value["isChecked"] = newValue;
              isContinentCheked = value["isChecked"];

              //if a specific item is selected add to list or else remove from list
              if (isContinentCheked == true) {
                continentCheckList.add(value["name"]);
              } else {
                continentCheckList.remove(value["name"]);
              }
            });
          });
    }).toList());
  }
}
