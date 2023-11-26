
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:squarement_task/features/main_layout/screens/main_layout_screen.dart';
import 'core/theme/theme_data/theme_data_light.dart';
import 'core/utils/base_provider.dart';
import 'core/utils/locator.dart';
import 'features/home/provider/home_provider.dart';
import 'features/main_layout/provider/main_layout_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setup();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseProvider()),
        ChangeNotifierProvider(create: (context) => MainLayoutProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),

      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context, child) => MaterialApp(
          title: 'Squarement task',
          debugShowCheckedModeBanner: false,
          theme: getThemeDataLight(),
          home: child,
        ),
        child: const MainLayoutScreen(),
      ),
    );
  }
}
