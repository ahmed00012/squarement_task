
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/base_provider.dart';
import '../../home/presentation/screens/home_screen.dart';

class MainLayoutProvider extends BaseProvider {

  static MainLayoutProvider get(BuildContext context) =>
      Provider.of<MainLayoutProvider>(context, listen: false);

  int bottomNavigationIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  bottomNavigationChanged(int index) {
    bottomNavigationIndex = index;
    notifyListeners();
  }


}
