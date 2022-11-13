import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetailsTextWidget extends StatelessWidget {
  final String text;
  final String value;
  const CountryDetailsTextWidget({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16.sp,
              ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
      ],
    );
  }
}
