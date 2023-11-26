import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseProvider with ChangeNotifier {
  static BaseProvider get(context) =>
      Provider.of<BaseProvider>(context, listen: false);
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  bool _isCreateLoading = false;

  bool get getIsCreateLoading => _isCreateLoading;

  set isCreateLoading(bool value) {
    _isCreateLoading = value;
    notifyListeners();
  }

  static bool checkAPIDataWithErrorSuccessCallback(
      {required res, Function? onSuccess, Function? onError}) {
    if (res.data['status'] == 1) {
      if (onSuccess != null) onSuccess(res.data["message"]);
      return true;
    } else {
      if (res.data['status'] == 0) {
        if (onError != null) {
          onError(res.data["message"]);
        }
      }
      return false;
    }
  }

}
