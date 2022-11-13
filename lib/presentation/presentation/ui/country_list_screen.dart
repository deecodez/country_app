import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:country_app/data/services/theme_provider.dart';
import 'package:country_app/presentation/component/expanded.dart';
import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:country_app/presentation/presentation/ui/country_details_screen.dart';
import 'package:country_app/presentation/presentation/ui/vm/fetch_country_list_vm.dart';
import 'package:country_app/presentation/presentation/ui/vm/filter_country_vm.dart';
import 'package:country_app/presentation/presentation/ui/widget/contient_check_box_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/filter_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/language_radio_button_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/search_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math' as math;

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

  String value = "";
  void _update(String newValue) {
    setState(() => value = newValue);
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(fetchCountryListVm);
    final filterByRegionResultVm = ref.watch(filterByRegionProvider);
    final listState = useState("");
    // final regionState = useState("");

    // final appThemeState = ref.read(appThemeStateNotifier);
    bool isSelected = false;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: AppColors.whiteColor,
          body: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Explore',
                        style: GoogleFonts.pacifico(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.exploreTextColor,
                        )),
                    GestureDetector(
                        onTap: () {
                          ref.read(darkModeProvider.notifier).toggle();
                        },
                        child: const Icon(FontAwesomeIcons.lightbulb)),
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
                              ExpandableTheme(
                                data: const ExpandableThemeData(
                                  iconColor: Colors.blue,
                                  useInkWell: true,
                                ),
                                child: ExpandableNotifier(
                                  child: ScrollOnExpand(
                                    child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        tapBodyToExpand: true,
                                        tapBodyToCollapse: true,
                                        hasIcon: false,
                                      ),
                                      header: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Region",
                                              style: GoogleFonts.poppins(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                          const ExpandableIcon(
                                            theme: ExpandableThemeData(
                                              expandIcon:
                                                  Icons.expand_more_outlined,
                                              collapseIcon:
                                                  Icons.expand_less_outlined,
                                              iconColor: AppColors.primaryColor,
                                              iconSize: 28.0,
                                              iconRotationAngle: math.pi / 2,
                                              iconPadding:
                                                  EdgeInsets.only(right: 5),
                                              hasIcon: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      collapsed: Container(),
                                      expanded: RegionCheckBoxWidget(
                                          isSelected: isSelected,
                                          conteinentNameselected: _update),
                                    ),
                                  ),
                                ),
                              ),
                              // isSelected == true
                              //     ?
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FilterActionButton(
                                    width: 104.w,
                                    border: Border.all(
                                      width: 1.w,
                                      color: AppColors.primaryColor,
                                    ),
                                    bgColor: Colors.transparent,
                                    textColor: AppColors.primaryColor,
                                    text: "Reset",
                                  ),
                                  SizedBox(width: 40.w),
                                  FilterActionButton(
                                    width: 236.w,
                                    bgColor: AppColors.orangeColor,
                                    textColor: AppColors.whiteColor,
                                    text: "Show Results",
                                    onTap: () {
                                      print(value);
                                      ref
                                          .read(filterByRegionProvider.notifier)
                                          .filterByRegion(value);

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
                //TODO: Perefect way to fetch filter by region
                // filterByRegionResultVm.when(success: (){}, idle:() => const Center(
                //               //TODO: add shimmer effect
                //               child: CircularProgressIndicator(
                //                 color: AppColors.blackColor,
                //               ),
                //             ),error: (e, _) => Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   e.toString(),
                //                   style: const TextStyle(
                //                     fontSize: 18.0,
                //                     color: AppColors.blackColor,
                //                     fontWeight: FontWeight.w500,
                //                   ),
                //                 ),
                //                 TextButton.icon(
                //                     label: const Text('Retry'),
                //                     icon: const Icon(Icons.replay),
                //                     onPressed: () {
                //                       ref.refresh(fetchCountryListVm);
                //                     }),
                //               ],
                //             ), loading: () => const Center(
                //               //TODO: add shimmer effect
                //               child: CircularProgressIndicator(
                //                 color: AppColors.blackColor,
                //               ),
                //             ),),
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
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                            return const Text('No data found',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w500,
                                ));
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
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.searchIconColor,
                                ),
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

class FilterActionButton extends StatelessWidget {
  final double width;
  final Color bgColor;
  final BoxBorder? border;
  final Color textColor;
  final String text;
  final void Function()? onTap;
  const FilterActionButton({
    required this.width,
    this.border,
    required this.bgColor,
    required this.textColor,
    required this.text,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48.h,
        decoration: BoxDecoration(
          color: bgColor,
          border: border,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetCloseWidget extends StatelessWidget {
  final String text;
  const BottomSheetCloseWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(0.4),
            ),
            child: Icon(Icons.close, color: AppColors.greyColor, size: 18.sp),
          ),
        ),
      ],
    );
  }
}

class CountryBuildNameWidget extends StatelessWidget {
  final String countryName;
  final String capital;
  final String imgUrl;
  final Function()? onTap;
  const CountryBuildNameWidget({
    Key? key,
    required this.countryName,
    required this.capital,
    required this.imgUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: FittedBox(
              child:

                  // Image.network(imgUrl)
                  CachedNetworkImage(
                imageUrl: imgUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                countryName,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                capital,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.searchIconColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
