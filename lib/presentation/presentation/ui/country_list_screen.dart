import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:country_app/presentation/presentation/ui/country_details_screen.dart';
import 'package:country_app/presentation/presentation/ui/vm/fetch_country_list_vm.dart';
import 'package:country_app/presentation/presentation/ui/widget/filter_widget.dart';
import 'package:country_app/presentation/presentation/ui/widget/search_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CountryListScreen extends HookConsumerWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(fetchCountryListVm);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text('Explore'),
                  Icon(Icons.mood_outlined),
                ],
              ),
              SizedBox(height: 24.h),
              const SearchFormField(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterWidget(
                    containerWidth: 73.w,
                    color: AppColors.whiteColor,
                    icon: Icons.language,
                    text: "EN",
                  ),
                  FilterWidget(
                    containerWidth: 86.w,
                    color: AppColors.containerBgColor,
                    //TODO: To change the filter icon
                    icon: Icons.filter_1_outlined,
                    text: "Filter",
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              vm.when(
                  loading: () => const Center(
                        //TODO: add shimmer effect
                        child: CircularProgressIndicator(
                          color: AppColors.blackColor,
                        ),
                      ),
                  error: (e, _) => Center(
                        child: Text(
                          e.toString(),
                          // 'Cannot fetch rankings at the moment.',
                          style: const TextStyle(
                            fontSize: 23.0,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  data: (data) {
                    if (data.isEmpty) {
                      return const Text('No data found',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                          ));
                    }
                    // return ListView.separated(
                    //     itemBuilder: (context, index) {
                    //       final country = data[index];
                    //       return CountryBuildNameWidget(
                    //         countryName: country.name!.common!,
                    //         capital: country.capital![0],
                    //       );
                    //     },
                    //     separatorBuilder: (context, index) {
                    //       return SizedBox(height: 20.h);
                    //     },
                    //     itemCount: 20);
                    return Expanded(
                      child: GroupedListView<CountryListModel, String?>(
                        elements: data,
                        groupBy: (element) => element.name!.common![0],
                        useStickyGroupSeparators: false,
                        groupHeaderBuilder: (CountryListModel? value) => Text(
                          // 'A',
                          value!.name!.common![0],
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.searchIconColor,
                          ),
                        ),
                        // groupSeparatorBuilder: (value) {
                        //   return SizedBox(height: 20.h);
                        // },
                        //             Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         value?.title ?? '',
                        //         textAlign: TextAlign.left,
                        //         style: const TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.w400),
                        //       ),
                        //       Text(
                        //         value?.quizPrice ?? '',
                        //         textAlign: TextAlign.left,
                        //         style: const TextStyle(
                        //             color: AppColors.secondaryColor,
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        itemBuilder:
                            (BuildContext context, CountryListModel country) =>
                                Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CountryBuildNameWidget(
                            imgUrl: country.flags!.png!,
                            // imgUrl: country.flag!,
                            countryName: country.name!.common!,
                            capital: country.capital!.isEmpty
                                ? ''
                                : country.capital![0],
                          ),
                        ),
                      ),
                    );
                  }),
              // Text(
              //   'A',
              //   style: GoogleFonts.poppins(
              //     fontSize: 14.sp,
              //     fontWeight: FontWeight.w600,
              //     color: AppColors.searchIconColor,
              //   ),
              // ),
              // SizedBox(height: 19.h),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryBuildNameWidget extends StatelessWidget {
  final String countryName;
  final String capital;
  final String imgUrl;
  const CountryBuildNameWidget({
    Key? key,
    required this.countryName,
    required this.capital,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return const CountryDetailsScreen();
        })));
      },
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: FittedBox(child: Image.network(imgUrl)
                // CachedNetworkImage(
                //   imageUrl: imgUrl,
                //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                //       CircularProgressIndicator(value: downloadProgress.progress),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
                // Text(
                //   'A',
                //   style: GoogleFonts.poppins(
                //     fontSize: 14.sp,
                //     fontWeight: FontWeight.w600,
                //     color: AppColors.searchIconColor,
                //   ),
                // ),
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
