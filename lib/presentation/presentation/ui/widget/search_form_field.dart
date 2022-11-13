import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchFormField extends HookConsumerWidget {
  final ValueChanged<String>? onChanged;
  const SearchFormField({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.searchIconColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          hintText: 'Search Country',
          hintStyle: Theme.of(context).textTheme.bodyText1,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFormFieldBgColor),
            borderRadius: BorderRadius.circular(4.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFormFieldBgColor),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
