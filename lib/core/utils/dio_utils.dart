import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'locator.dart';



class DioUtils {
  final Dio _dio;
  static DioUtils? _instance;

  DioUtils._(this._dio);

  static DioUtils getInstance() {
    if (_instance == null) {
      Dio dio = Dio();
      _instance = DioUtils._(dio);
    }
    return _instance!;
  }

  makePostRequest(
    String endPoint,
    Map<String, dynamic> postValues, {
    Map<String, dynamic>? headers,
    bool withToken = true,
    Map<String, dynamic>? query,
  }) async {
    FormData formData = FormData.fromMap(postValues);
    Response response;
    try {
      _dio.options.headers["Accept"] = "application/json";
      _dio.options.headers["test"] = '1';
      if (withToken == true) {
        // _dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";
      }
      if (headers != null) _dio.options.headers.addAll(headers);
      debugPrint('MakePostRequest url is #$endPoint');
      debugPrint('MakePostRequest body are #${postValues.toString()}');
      debugPrint('MakeGetRequest query is #$query');
      response =
          await _dio.post(endPoint, data: formData, queryParameters: query);
      debugPrint('MakePostRequest done');
      return response;
    } on DioError catch (e) {
      if (e.response!.statusMessage.toString() == 'Unauthorized') {
        // MethodHelpers.previewToast(msg:'انتهت صلاحية الجلسة : لقد تم التسجيل من جهاز اخر يرجى تسجيل الدخول مره اخرى ');
        // MethodHelpers.navigateAndRemoveUntil(Get.context!, const SignInScreen());

      }
      return e.response ?? 'ttt';
    } catch (e, s) {
      debugPrint('MakePostRequest >>>>>>>>>>>$s');
      debugPrint(e.toString());
      return e.toString();
    }
  }

  makeGetRequest(
    String endPoint, {

    Map<String, dynamic>? headers,
    bool withToken = true,
    Map<String, dynamic>? query,
  }) async {
    Response response;
    try {
      _dio.options.headers["Accept"] = "application/json";
      if (headers != null) {
        headers.forEach((key, value) {
          _dio.options.headers[key] = value.toString();
        });
      }
      if (withToken == true) {
        // _dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";
      }
      debugPrint('MakeGetRequest url is #$endPoint');
      debugPrint('MakeGetRequest query is #$query');
      // debugPrint('MakeGetRequest token is #${getUserToken()}');
      response = await _dio.get(
        endPoint,
        queryParameters: query,
      );
      debugPrint('MakeGetRequest done');
      print(response.statusCode);
      return response;
    } on DioError catch (e) {
      if (e.response!.statusMessage.toString() == 'Unauthorized') {
        // MethodHelpers.previewToast(msg:'انتهت صلاحية الجلسة : لقد تم التسجيل من جهاز اخر يرجى تسجيل الدخول مره اخرى ');
        // MethodHelpers.navigateAndRemoveUntil(
        //     Get.context!, const SignInScreen());

      }
      debugPrint('>>>>>>>>>>>>>>>MakeGetRequest${e.response!.statusMessage}');
      debugPrint(e.toString());
      return e.response!;
    } catch (e, s) {
      debugPrint('MakeGetRequest >>>>>>>>>>>$s');
      debugPrint(e.toString());
      return e.toString();
    }
  }

  makeDeleteRequest(
    String endPoint, {
    Map<String, dynamic>? headers,
    bool withToken = true,
    Map<String, dynamic>? query,
  }) async {
    Response response;
    try {
      _dio.options.headers["Accept"] = "application/json";
      if (withToken == true) {
        // _dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";
      }
      debugPrint('MakeDeleteRequest url is #$endPoint');
      debugPrint('MakeDeleteRequest headers are #${_dio.options.headers}');
      response = await _dio.delete(endPoint, queryParameters: query);
      debugPrint('MakeDeleteRequest done');
      return response;
    } on DioError catch (e) {
      if (e.response!.statusMessage.toString() == 'Unauthorized') {
        // MethodHelpers.previewToast(msg:'انتهت صلاحية الجلسة : لقد تم التسجيل من جهاز اخر يرجى تسجيل الدخول مره اخرى ');
        // MethodHelpers.navigateAndRemoveUntil(
        //     Get.context!, const SignInScreen());

      }
      debugPrint(e.toString());
      return e.response!;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  downloadRequest({required String url, required String savePath}) async {
    Response response;
    try {
      _dio.options.headers["Accept"] = "application/json";
      // _dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";
      debugPrint('MakeDownloadRequest url is #$url');
      response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            debugPrint("${(count / total * 100).toStringAsFixed(0)}%");
          }
        },
      );
      debugPrint('MakeDownloadRequest done');
      return response;
    } on DioError catch (e) {
      if (e.response!.statusMessage.toString() == 'Unauthorized') {
        // MethodHelpers.previewToast(msg:'انتهت صلاحية الجلسة : لقد تم التسجيل من جهاز اخر يرجى تسجيل الدخول مره اخرى ');
        // MethodHelpers.navigateAndRemoveUntil(
        //     Get.context!, const SignInScreen());

      }
      debugPrint(e.toString());
      return e.response!;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }
}
