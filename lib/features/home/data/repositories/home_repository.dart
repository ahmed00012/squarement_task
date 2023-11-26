
import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../../core/constants/api.dart';
import '../../../../core/utils/base_repo.dart';

class HomeRepository extends BaseRepository {
  static HomeRepository? _instance;

  HomeRepository._();

  static HomeRepository getInstance() {
    _instance ??= HomeRepository._();
    return _instance!;
  }


  // call photos api
  Future getAllPhotos() async {
    debugPrint('Repo getting All Photos ');
    var result = await dio.makeGetRequest(APIEndPoints.kPhotos);
    debugPrint('Repo get All Photos $result');
    if(result.statusCode == 200) {
      return result;
    }
    else{
      return false;
    }

  }



  // call users api
  Future getAllUsers() async {
    debugPrint('Repo getting All Users ');
    var result = await dio.makeGetRequest(APIEndPoints.kUsers);
    debugPrint('Repo get All Users $result');
    if(result.statusCode == 200) {
      return result;
    }
    else{
      return false;
    }
  }



}