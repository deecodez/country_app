import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: Theme.of(context).textTheme.headline2,
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
