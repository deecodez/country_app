import 'package:country_app/presentation/presentation/components/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterWidget extends StatelessWidget {
  final double containerWidth;
  final Color color;
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const FilterWidget({
    Key? key,
    required this.containerWidth,
    required this.color,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            width: containerWidth,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                width: 0.2.w,
                color: AppColors.containerBorderColor,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.containerBoxShadowRgba,
                  blurRadius: 2.r,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.primaryColor),
                SizedBox(width: 10.w),
                Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColors.blackColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
