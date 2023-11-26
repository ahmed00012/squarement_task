
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/base_provider.dart';

class MainLayoutProvider extends BaseProvider {

  static MainLayoutProvider get(BuildContext context) =>
      Provider.of<MainLayoutProvider>(context, listen: false);

  int bottomNavigationIndex = 0;

  bottomNavigationChanged(int index) {
    bottomNavigationIndex = index;
    notifyListeners();
  }


}
