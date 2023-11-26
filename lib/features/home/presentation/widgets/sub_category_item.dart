

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_color/app_colors.dart';
import '../../../shared_widgets/text_widget.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({Key? key, required this.title, this.color,
    this.whiteColor = false, this.onTap}) : super(key: key);
  final String title;
  final Color? color;
  final bool whiteColor;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(3.h),
      child: GestureDetector(
        onTap: ()=> onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? AppColor.whiteColor,
              border: Border.all(color: color ?? AppColor.borderColor),
            borderRadius: BorderRadius.circular(3.r)
          ),
          child: Center(
            child: TextWidget(
              text: title,
              fontSize: 12.sp,
              maxLines: 3,
              textAlign: TextAlign.center,
              color: whiteColor? AppColor.whiteColor : AppColor.primaryColor ,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
