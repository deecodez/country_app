import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:country_app/presentation/presentation/ui/widget/country_details_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: 30.sp,
          ),
        ),
        title: Text(
          country.name!.common!,
          style: Theme.of(context).textTheme.headline2,
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

                  SizedBox(height: 24.h),
                  CountryDetailsTextWidget(
                    text: 'Independence:',
                    value: country.independent.toString(),
                  ),
                  SizedBox(height: 4.h),
                  CountryDetailsTextWidget(
                      text: 'Area:', value: country.area.toString()),
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
