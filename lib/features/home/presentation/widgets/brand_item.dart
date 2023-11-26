

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color/app_colors.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.h),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(3.r),
            border: Border.all(color: AppColor.borderColor)
        ),
        child: Image.asset(image,
            fit: BoxFit.fill),
      ),
    );
  }
}
