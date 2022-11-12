import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:country_app/presentation/presentation/ui/widget/country_details_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryDetailsScreen extends StatelessWidget {
  final CountryListModel country;
  const CountryDetailsScreen({required this.country, Key? key})
      : super(key: key);

  String formatTextWithComma(String text) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    // ignore: prefer_function_declarations_over_variables
    final mathFunc = (Match match) => '${match[1]},';

    String result = text.replaceAllMapped(reg, mathFunc);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // List parsePhotos = json.decode(country.currencies.to);
    return Scaffold(
      // backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: 30.sp,
            color: AppColors.blackColor,
          ),
        ),
        title: Text(
          country.name!.common!,
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
        child: Column(
          children: [
            //TODO: To used it as background image in container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.network(
                country.flags!.png!,
                // width: 380.w,
                // height: 200.h,
              ),
            ),
            SizedBox(height: 24.5.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 30.h),
                shrinkWrap: true,
                children: [
                  CountryDetailsTextWidget(
                    text: 'Population:',
                    value: country.population == null
                        ? ''
                        : formatTextWithComma(country.population.toString()),
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Capital:',
                    value: country.capital!.isEmpty ? '' : country.capital![0],
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Region:',
                    //TODO: To make the first text captilaize
                    value: country.region == null ? '' : country.region!.name,
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Sub-Region:',
                    value: country.subregion == null ? '' : country.subregion!,
                  ),
                  SizedBox(height: 24.h),
                  CountryDetailsTextWidget(
                    text: 'Official language:',
                    value: country.languages == null
                        ? ''
                        : country.languages!.values.first,
                  ),
                  SizedBox(height: 4.h),
                  //TODO:
                  CountryDetailsTextWidget(
                    text: 'Continents:',
                    value: country.continents == null
                        ? ''
                        : country.continents!.first.name,
                  ),
                  SizedBox(height: 4.h),
                  // const CountryDetailsTextWidget(
                  //   text: 'Ethic group:',
                  //   value: 'Andorran, Spanish, Portuguese',
                  // ),
                  // SizedBox(height: 4.h),
                  //TODO:
                  // const CountryDetailsTextWidget(
                  //   text: 'Religion:',
                  //   value: 'Christianity',
                  // ),
                  CountryDetailsTextWidget(
                    text: 'Official Name:',
                    value: country.name!.official == null
                        ? ''
                        : country.name!.official!,
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Native Name:',
                    value: country.name!.nativeName == null
                        ? ''
                        : country.name!.nativeName!.values.first.official!,
                  ),
                  // const CountryDetailsTextWidget(
                  //   text: 'Government:',
                  //   value: 'Parliamentary democracy',
                  // ),
                  SizedBox(height: 24.h),
                  CountryDetailsTextWidget(
                    text: 'Independence:',
                    value: country.independent.toString(),
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                      text: 'Area:', value: country.area.toString()
                      // '467.63 km2',
                      ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                      text: 'Currency:',
                      value: country.currencies!.values.first.name == null
                          ? ''
                          : country.currencies!.values.first.name!),

                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Status:',
                    value: country.status!.name,
                  ),
                  // const CountryDetailsTextWidget(
                  //   text: 'GDP:',
                  //   value: 'US\$3.400 billion',
                  // ),
                  SizedBox(height: 24.h),
                  CountryDetailsTextWidget(
                    text: 'Time zone:',
                    value: country.timezones == null
                        ? ''
                        : country.timezones!.first,
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Week Start:',
                    value: country.startOfWeek == null
                        ? ""
                        : country.startOfWeek!.name,
                  ),
                  // const CountryDetailsTextWidget(
                  //   text: 'Date format:',
                  //   value: 'dd/mm/yyyy',
                  // ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Dialling code:',
                    value: country.idd == null ? '' : country.idd!.root!,
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Driving side:',
                    value: country.car!.side == null
                        ? ""
                        : country.car!.side!.name,
                  ),
                  SizedBox(height: 24.h),
                  CountryDetailsTextWidget(
                    text: 'Car Sign:',
                    value: country.car!.signs == null
                        ? ''
                        : country.car!.signs!.first,
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                    text: 'Fifa:',
                    value: country.fifa == null ? '' : country.fifa!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// [{
//         "name": {
//             "common": "Lesotho",
//             "official": "Kingdom of Lesotho",
//             "nativeName": {
//                 "eng": {
//                     "official": "Kingdom of Lesotho",
//                     "common": "Lesotho"
//                 },
//                 "sot": {
//                     "official": "Kingdom of Lesotho",
//                     "common": "Lesotho"
//                 }
//             }
//         },
//         "tld": [
//             ".ls"
//         ],
//         "cca2": "LS",
//         "ccn3": "426",
//         "cca3": "LSO",
//         "cioc": "LES",
//         "independent": true,
//         "status": "officially-assigned",
//         "unMember": true,
//         "currencies": {
//             "LSL": {
//                 "name": "Lesotho loti",
//                 "symbol": "L"
//             },
//             "ZAR": {
//                 "name": "South African rand",
//                 "symbol": "R"
//             },
//              "HKD": {
//                 "name": "Hong Kong dollar",
//                 "symbol": "$"
//             }
//         },
//         "idd": {
//             "root": "+2",
//             "suffixes": [
//                 "66"
//             ]
//         },
//         "capital": [
//             "Maseru"
//         ],
//         "altSpellings": [
//             "LS",
//             "Kingdom of Lesotho",
//             "Muso oa Lesotho"
//         ],
//         "region": "Africa",
//         "subregion": "Southern Africa",
//         "languages": {
//             "eng": "English",
//             "sot": "Sotho"
//         },
//         "translations": {
//             "ara": {
//                 "official": "مملكة ليسوتو",
//                 "common": "ليسوتو"
//             },
//             "bre": {
//                 "official": "Rouantelezh Lesotho",
//                 "common": "Lesotho"
//             },
//             "ces": {
//                 "official": "Lesothské království",
//                 "common": "Lesotho"
//             },
//             "cym": {
//                 "official": "Kingdom of Lesotho",
//                 "common": "Lesotho"
//             },
//             "deu": {
//                 "official": "Königreich Lesotho",
//                 "common": "Lesotho"
//             },
//             "est": {
//                 "official": "Lesotho Kuningriik",
//                 "common": "Lesotho"
//             },
//             "fin": {
//                 "official": "Lesothon kuningaskunta",
//                 "common": "Lesotho"
//             },
//             "fra": {
//                 "official": "Royaume du Lesotho",
//                 "common": "Lesotho"
//             },
//             "hrv": {
//                 "official": "Kraljevina Lesoto",
//                 "common": "Lesoto"
//             },
//             "hun": {
//                 "official": "Lesothói Királyság",
//                 "common": "Lesotho"
//             },
//             "ita": {
//                 "official": "Regno del Lesotho",
//                 "common": "Lesotho"
//             },
//             "jpn": {
//                 "official": "レソト王国",
//                 "common": "レソト"
//             },
//             "kor": {
//                 "official": "레소토 왕국",
//                 "common": "레소토"
//             },
//             "nld": {
//                 "official": "Koninkrijk Lesotho",
//                 "common": "Lesotho"
//             },
//             "per": {
//                 "official": "پادشاهی لسوتو",
//                 "common": "لسوتو"
//             },
//             "pol": {
//                 "official": "Królestwo Lesotho",
//                 "common": "Lesotho"
//             },
//             "por": {
//                 "official": "Reino do Lesoto",
//                 "common": "Lesoto"
//             },
//             "rus": {
//                 "official": "Королевство Лесото",
//                 "common": "Лесото"
//             },
//             "slk": {
//                 "official": "Lesothské kráľovstvo",
//                 "common": "Lesotho"
//             },
//             "spa": {
//                 "official": "Reino de Lesotho",
//                 "common": "Lesotho"
//             },
//             "swe": {
//                 "official": "Konungariket Lesotho",
//                 "common": "Lesotho"
//             },
//             "tur": {
//                 "official": "Lesotho Krallığı",
//                 "common": "Lesotho"
//             },
//             "urd": {
//                 "official": "مملکتِ لیسوتھو",
//                 "common": "لیسوتھو"
//             },
//             "zho": {
//                 "official": "莱索托王国",
//                 "common": "莱索托"
//             }
//         },
//         "latlng": [
//             -29.5,
//             28.5
//         ],
//         "landlocked": true,
//         "borders": [
//             "ZAF"
//         ],
//         "area": 30355.0,
//         "demonyms": {
//             "eng": {
//                 "f": "Mosotho",
//                 "m": "Mosotho"
//             },
//             "fra": {
//                 "f": "Lésothienne",
//                 "m": "Lésothien"
//             }
//         },
//         "flag": "🇱🇸",
//         "maps": {
//             "googleMaps": "https://goo.gl/maps/H8gJi5mL4Cmd1SF28",
//             "openStreetMaps": "https://www.openstreetmap.org/relation/2093234"
//         },
//         "population": 2142252,
//         "gini": {
//             "2017": 44.9
//         },
//         "fifa": "LES",
//         "car": {
//             "signs": [
//                 "LS"
//             ],
//             "side": "left"
//         },
//         "timezones": [
//             "UTC+02:00"
//         ],
//         "continents": [
//             "Africa"
//         ],
//         "flags": {
//             "png": "https://flagcdn.com/w320/ls.png",
//             "svg": "https://flagcdn.com/ls.svg"
//         },
//         "coatOfArms": {
//             "png": "https://mainfacts.com/media/images/coats_of_arms/ls.png",
//             "svg": "https://mainfacts.com/media/images/coats_of_arms/ls.svg"
//         },
//         "startOfWeek": "monday",
//         "capitalInfo": {
//             "latlng": [
//                 -29.32,
//                 27.48
//             ]
//         },
//         "postalCode": {
//             "format": "###",
//             "regex": "^(\\d{3})$"
//         }
//     }
//     ]