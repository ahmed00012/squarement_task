

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared_widgets/text_widget.dart';

class MainCategoryItem extends StatelessWidget {
  const MainCategoryItem({Key? key,
  required this.index, required this.selectedIndex,
    required this.title, required this.onTap,
  }) : super(key: key);
  final int index;
  final int selectedIndex;
  final String title;
  final VoidCallback onTap;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Container(
        height: 50.h,
        width: 0.25.sw,
        decoration: BoxDecoration(
            color: selectedIndex == index
                ? Colors.white
                : Colors.grey[100],
            border: Border(
                left: BorderSide(
                    color: selectedIndex == index
                        ? Colors.red
                        : Colors.grey[100]!,
                    width: 2.w))),
        child: Center(
            child: TextWidget(
              text: title,
              fontSize: 12.sp,
              fontWeight: selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            )),
      ),
    );
  }
}
