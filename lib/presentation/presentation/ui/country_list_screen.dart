import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:country_app/data/services/theme_provider.dart';
import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:country_app/presentation/presentation/ui/country_details_screen.dart';
import 'package:country_app/presentation/presentation/ui/vm/fetch_country_list_vm.dart';
import 'package:country_app/presentation/presentation/ui/widget/bottom_sheet_close_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/country_build_name_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/expanded_text_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/filter_action_button.dart';
import 'package:country_app/presentation/presentation/ui/widget/filter_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/language_radio_button_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/search_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';

class CountryListScreen extends StatefulHookConsumerWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CountryListScreenState();
}

class _CountryListScreenState extends ConsumerState<CountryListScreen> {
  List<CountryListModel> countries = [];
  List<CountryListModel> filterableCountry = [];

  Future<List<CountryListModel>> filterCountry(
      {required List<CountryListModel> countrys, required String text}) {
    if (text.isEmpty) {
      countrys = countries;
      return Future.value(countrys);
    }
    List<CountryListModel> result = countrys
        .where((country) =>
            country.name!.common!.toUpperCase().contains(text.toUpperCase()))
        .toList();
    return Future.value(result);
  }

  void _filterabledCountry(String text) async {
    filterableCountry = await filterCountry(countrys: countries, text: text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(fetchCountryListVm);
    final toggleDarkMode = ref.watch(darkModeProvider);
    final listState = useState("");

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(darkModeProvider.notifier).toggle();
                      },
                      child: toggleDarkMode
                          ? const Icon(FontAwesomeIcons.moon)
                          : const Icon(FontAwesomeIcons.sun),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                SearchFormField(
                  onChanged: (value) {
                    _filterabledCountry(value);
                    listState.value = value;
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterWidget(
                      containerWidth: 73.w,
                      color: AppColors.whiteColor,
                      icon: Icons.language,
                      text: "EN",
                      onTap: () => showModalBottomSheet(
                        barrierColor: const Color(0xFF757575),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0.sp),
                          ),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Container(
                            height: 600.h,
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: Column(
                              children: [
                                const BottomSheetCloseWidget(
                                  text: "Languages",
                                ),
                                SizedBox(height: 24.h),
                                const LanguageRadioButtonWidget(),
                              ],
                            )),
                      ),
                    ),
                    FilterWidget(
                      containerWidth: 86.w,
                      color: AppColors.containerBgColor,
                      icon: FontAwesomeIcons.filter,
                      text: "Filter",
                      onTap: () => showModalBottomSheet(
                        barrierColor: const Color(0xFF757575),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0.sp),
                          ),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Container(
                          height: 600.h,
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 20.h),
                          child: Column(
                            children: [
                              const BottomSheetCloseWidget(
                                text: "Filter",
                              ),
                              SizedBox(height: 24.h),
                              const ExpandedTextWidget(),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //TODO: To find a way implementing the reset
                                  FilterActionButton(
                                    width: 104.w,
                                    border: Border.all(
                                      width: 1.w,
                                      color: AppColors.primaryColor,
                                    ),
                                    bgColor: Colors.transparent,
                                    textColor: AppColors.primaryColor,
                                    text: "Reset",
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(width: 40.w),
                                  //TODO: To find a way implementing the filter by region functionality
                                  FilterActionButton(
                                    width: 236.w,
                                    bgColor: AppColors.orangeColor,
                                    textColor: AppColors.whiteColor,
                                    text: "Show Results",
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                              // : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                //TODO: To use shimmer or skeleton effect for loading state
                listState.value.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10.h);
                            },
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            itemCount: filterableCountry.length,
                            itemBuilder: (context, index) {
                              final countryFilter = filterableCountry[index];
                              return CountryBuildNameWidget(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return CountryDetailsScreen(
                                      country: countryFilter,
                                    );
                                  })));
                                },
                                imgUrl: countryFilter.flags!.png!,
                                countryName: countryFilter.name!.common!,
                                capital: countryFilter.capital!.isEmpty
                                    ? ''
                                    : countryFilter.capital![0],
                              );
                            }),
                      )
                    : vm.when(
                        loading: () => const Center(
                              //TODO: add shimmer effect
                              child: CircularProgressIndicator(
                                color: AppColors.blackColor,
                              ),
                            ),
                        error: (e, _) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.toString(),
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                TextButton.icon(
                                    label: const Text('Retry'),
                                    icon: const Icon(Icons.replay),
                                    onPressed: () {
                                      ref.refresh(fetchCountryListVm);
                                    }),
                              ],
                            ),
                        data: (data) {
                          setState(() {
                            countries = data;
                          });
                          if (data.isEmpty) {
                            return Text(
                              'No data found',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3,
                            );
                          }
                          //TODO: To add spacing at the end of each country
                          return Expanded(
                            child: GroupedListView<CountryListModel, String?>(
                              elements: data,
                              groupBy: (element) => element.name!.common![0],
                              useStickyGroupSeparators: false,
                              groupHeaderBuilder: (CountryListModel? value) =>
                                  Text(
                                value!.name!.common![0],
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              itemBuilder: (BuildContext context,
                                      CountryListModel country) =>
                                  Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: CountryBuildNameWidget(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: ((context) {
                                      return CountryDetailsScreen(
                                        country: country,
                                      );
                                    })));
                                  },
                                  imgUrl: country.flags!.png!,
                                  countryName: country.name!.common!,
                                  capital: country.capital!.isEmpty
                                      ? ''
                                      : country.capital![0],
                                ),
                              ),
                            ),
                          );
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
