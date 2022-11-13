import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              child: CachedNetworkImage(
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
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 2.h),
              Text(
                capital,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
