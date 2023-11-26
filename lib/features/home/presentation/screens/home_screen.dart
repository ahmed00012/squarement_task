import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squarement_task/core/theme/app_color/app_colors.dart';
import 'package:squarement_task/features/home/presentation/widgets/main_category_item.dart';
import 'package:squarement_task/features/home/presentation/widgets/sub_category_item.dart';

import '../../../shared_widgets/text_widget.dart';
import '../../provider/home_provider.dart';
import '../widgets/brand_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_){
    HomeProvider.get(context).getAllPhotos();
    HomeProvider.get(context).getAllUsers();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, homeProvider, _) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 0.25.sw,
              padding: EdgeInsets.all(10.h),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeProvider.mainCategory.length,
                  itemBuilder: (context, index) {
                    return MainCategoryItem(
                        index: index,
                        selectedIndex: homeProvider.selectedCategoryIndex,
                        title: homeProvider.mainCategory[index],
                        onTap: ()=> homeProvider.mainCategoryChangeIndex(index)
                    );

                  }),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(10.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Image.asset('assets/images/Screenshot 2023-11-26 193026.png',
                        fit: BoxFit.fill,
                      height: 0.18.sh,),
                      SizedBox(height: 5.h,),
                      GridView.builder(
                        itemCount: homeProvider.subCategory.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.9
                          ),
                          itemBuilder: (context,index){
                            return SubCategoryItem(title: homeProvider.subCategory[index]);
                          }),
                      SizedBox(height: 10.h,),
                       SizedBox(
                         height: 50.h,
                         child: const Row(
                          children: [
                            Expanded(child: SubCategoryItem(title: 'SALE',color: Colors.red,whiteColor: true,)),
                            Expanded(child: SubCategoryItem(title: 'NEW IN',color: Colors.black,whiteColor: true)),
                            Expanded(child: SubCategoryItem(title: 'BESTSELLER',color: Colors.orange,))
                          ],
                      ),
                       ),

                      SizedBox(height: 10.h,),
                      Image.asset('assets/images/Screenshot 2023-11-26 193111.png',
                        fit: BoxFit.cover,
                        height: 0.15.sh,),
                      SizedBox(height: 10.h,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(text: 'Featured Brands',fontWeight: FontWeight.bold,
                        fontSize: 16.sp,),
                      ),
                      SizedBox(height: 5.h,),
                      GridView.builder(
                          itemCount: homeProvider.brands.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.9
                          ),
                          itemBuilder: (context,index){
                            return BrandItem(image: homeProvider.brands[index],);
                          }),

                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),
              ),
            )


          ],
        );
      }),
    );
  }
}
