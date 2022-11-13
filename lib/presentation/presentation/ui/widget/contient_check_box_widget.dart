import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegionCheckBoxWidget extends StatefulWidget {
  bool isSelected;
  // String conteinentNameselected;
  final ValueChanged<String> conteinentNameselected;
  RegionCheckBoxWidget(
      {required this.isSelected,
      required this.conteinentNameselected,
      Key? key})
      : super(key: key);

  @override
  State<RegionCheckBoxWidget> createState() => _RegionCheckBoxWidgetState();
}

// Default Radio Button Item
// String? conteinentNameselected;

// Group Value for Radio Button.
int? indexSelected;
// bool isSelected = false;

class _RegionCheckBoxWidgetState extends State<RegionCheckBoxWidget> {
  List<ContinentList> continentList = [
    ContinentList(index: 1, name: "Africa"),
    ContinentList(index: 2, name: "Antarctic"),
    ContinentList(index: 3, name: "Asia"),
    ContinentList(index: 4, name: "Europe"),
    ContinentList(index: 5, name: "NorthAmerica"),
    ContinentList(index: 6, name: "Oceania"),
    ContinentList(index: 7, name: "SouthAmerica"),
  ];
  @override
  Widget build(BuildContext context) {
    return // The checkboxes will be here
        Column(
      children: continentList
          .map((data) => RadioListTile(
                toggleable: true,
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
                  print(val);
                  widget.conteinentNameselected(data.name);
                  setState(() {
                    // widget.conteinentNameselected = data.name;
                    indexSelected = data.index;
                    widget.isSelected = true;
                  });
                  print(widget.conteinentNameselected);
                },
              ))
          .toList(),
    );
  }
}

class ContinentList {
  String name;
  int index;
  ContinentList({required this.name, required this.index});
}




// import 'package:country_app/presentation/presentation/components/values.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RegionCheckBoxWidget extends StatefulWidget {
//   const RegionCheckBoxWidget({Key? key}) : super(key: key);

//   @override
//   State<RegionCheckBoxWidget> createState() => _RegionCheckBoxWidgetState();
// }

// bool isContinentCheked = false;

// //Declaring empty list to accept list of categories selected
// List<String> continentCheckList = [];

// class _RegionCheckBoxWidgetState extends State<RegionCheckBoxWidget> { 
//   List<Map> continentList = [
//     {"name": "Africa", "isChecked": false},
//     {"name": "Antarctica", "isChecked": false},
//     {"name": "Asia", "isChecked": false},
//     {"name": "Europe", "isChecked": false},
//     {"name": "NorthAmerica", "isChecked": false},
//     {"name": "Oceania", "isChecked": false},
//     {"name": "SouthAmerica", "isChecked": false},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return // The checkboxes will be here
//         Column(
//             children: continentList.map((value) {
//       return CheckboxListTile(
//           activeColor: AppColors.primaryColor,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
//           controlAffinity: ListTileControlAffinity.trailing,
//           value: value["isChecked"],
//           title: Text(
//             value["name"],
//             style: GoogleFonts.poppins(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w400,
//               color: AppColors.searchIconColor,
//             ),
//           ),
//           onChanged: (newValue) {
//             setState(() {
//               value["isChecked"] = newValue;
//               isContinentCheked = value["isChecked"];

//               //if a specific item is selected add to list or else remove from list
//               if (isContinentCheked == true) {
//                 continentCheckList.add(value["name"]);
//               } else {
//                 continentCheckList.remove(value["name"]);
//               }
//             });
//           });
//     }).toList());
//   }
// }
