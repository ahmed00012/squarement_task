
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme/app_color/app_colors.dart';

class MethodHelpers {
  const MethodHelpers._();



  static Future navigateTo(BuildContext context, createPage) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return createPage;
    }));
  }

  static Future navigateAndRemoveUntil(BuildContext context, createPage) async {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => createPage,
      ),
      (route) => false,
    );
  }

  static Future navigateToWithRemovingBottomBar(
      BuildContext context, createPage) async {
    return await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return createPage;
        },
      ),
    );
  }
  static void previewToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 16,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.secondaryColor,
    );
  }



  static String? validation(p0) {
    if (p0 == '') {
      return 'This Field is Required';
    }
    return null;
  }

  static void deleteLocally({
    required int index,
    required List selectedList,
  }) {
    selectedList.removeAt(index);
  }



}
