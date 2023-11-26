

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squarement_task/features/home/data/models/photos_model.dart';

import '../../../core/utils/base_provider.dart';
import '../../../core/utils/locator.dart';
import '../data/models/user_model.dart';
import '../data/repositories/home_repository.dart';

class HomeProvider extends BaseProvider {

  static HomeProvider get(BuildContext context) =>
      Provider.of<HomeProvider>(context, listen: false);
  final HomeRepository _homeRepository = sl<HomeRepository>();
  List<PhotoModel> photos = [];
  List<UserModel> users = [];
  List<String> mainCategory = [
    'Baby',
    'Toddler',
    'Kids',
    'Toys',
    'Maternity',
    'Gifts',
  ];
  int selectedCategoryIndex = 0;

  List<String> subCategory = [
    'Baby Boys${"'"} Clothes',
    'Baby Girls${"'"} Clothes',
    'Diapers',
    'Car Seats',
    'Strollers & Prams',
    'Walkers & Bouncers',
    'Bedroom Furniture',
    'Bedding Blankets',
    'Diaper Bags',
  ];

  List<String> brands = [
    'assets/images/Screenshot 2023-11-26 193136.png',
    'assets/images/Screenshot 2023-11-26 193152.png',
    'assets/images/Screenshot 2023-11-26 193207.png',
    'assets/images/Screenshot 2023-11-26 193221.png',
    'assets/images/Screenshot 2023-11-26 193238.png',
    'assets/images/Screenshot 2023-11-26 193253.png',
    'assets/images/Screenshot 2023-11-26 193312.png',
    'assets/images/Screenshot 2023-11-26 193327.png',
    'assets/images/Screenshot 2023-11-26 193344.png',
  ];





  //* Fetch Photos
  Future getAllPhotos({Function? onSuccess, Function? onError}) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await _homeRepository.getAllPhotos();
      if (response.data != false) {
        photos.clear();
        response.data.forEach((item) => photos.add(PhotoModel.fromJson(item)));
      }
      isLoading = false;
      notifyListeners();
      debugPrint("Provider get All Photos done");
      return BaseProvider.checkAPIDataWithErrorSuccessCallback(
        res: response,
        onSuccess: onSuccess,
        onError: onError,
      );
    } catch (e) {
      debugPrint('Provider get All Photos catchError ${e.toString()}');
      isLoading = false;
      notifyListeners();
    }
  }


  //* Fetch Users
  Future getAllUsers({Function? onSuccess, Function? onError}) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await _homeRepository.getAllUsers();
      if (response.data != false) {
        users.clear();
        response.data.forEach((item) => users.add(UserModel.fromJson(item)));
      }
      isLoading = false;
      notifyListeners();
      debugPrint("Provider get All Users done");
      return BaseProvider.checkAPIDataWithErrorSuccessCallback(
        res: response,
        onSuccess: onSuccess,
        onError: onError,
      );
    } catch (e) {
      debugPrint('Provider get All Users catchError ${e.toString()}');
      isLoading = false;
      notifyListeners();
    }
  }


  mainCategoryChangeIndex(int index){
    selectedCategoryIndex = index;
    notifyListeners();
  }


}
