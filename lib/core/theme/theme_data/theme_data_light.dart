
import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';

ThemeData getThemeDataLight() => ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColor.whiteColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(color: AppColor.primaryColor),
        selectedItemColor: AppColor.primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColor.primaryColor.withOpacity(.3),

        // selectedLabelStyle: TextStyle(fontSize: 12.sp),
      ),
    );
