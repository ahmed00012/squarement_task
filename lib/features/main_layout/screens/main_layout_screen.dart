
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:squarement_task/core/theme/app_color/app_colors.dart';

import '../../home/presentation/screens/home_screen.dart';
import '../provider/main_layout_provider.dart';
import '../widgets/search_text_field.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainLayoutProvider>(builder: (context, mainLayoutProvider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 0.1.sh,
            title: SafeArea(
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: SearchTextFieldWidget(
                   hintText: 'What are you looking for?'
                  ),
                ),
              ),
            ),
          ),
          body: mainLayoutProvider.screens[mainLayoutProvider.bottomNavigationIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: mainLayoutProvider.bottomNavigationIndex,
              backgroundColor: AppColor.whiteColor,
              onTap: (index) => mainLayoutProvider.bottomNavigationChanged(index),
              unselectedFontSize: 10.sp,
              selectedFontSize: 14.sp,
              items: const [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home)
                ),
                BottomNavigationBarItem(
                    label: 'Categories',
                    icon: Icon(Icons.manage_search)
                ),
                BottomNavigationBarItem(
                    label: 'Basket',
                    icon: Icon(Icons.shopping_bag_outlined)
                ),
                BottomNavigationBarItem(
                    label: 'My Lists',
                    icon: Icon(Icons.bookmark_add_outlined)
                ),
                BottomNavigationBarItem(
                    label: 'My Account',
                    icon: Icon(Icons.person_2_outlined)
                ),
              ]),
        );
      }
    );
  }
}
