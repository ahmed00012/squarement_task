import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color/app_colors.dart';


class SearchTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
   const SearchTextFieldWidget(
      {super.key, required this.hintText, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30.r),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
         Icon(Icons.search,color: Colors.cyan,),
          SizedBox(width: 8.w),
          Expanded(
            child: TextFormField(
              cursorColor: AppColor.secondaryColor,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: hintText,
                hintStyle: TextStyle(color: AppColor.hintColor, fontSize: 12.sp),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
