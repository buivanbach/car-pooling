import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';



import '../data/local/preference/preference_manager.dart';


class RequestHeaderInterceptor extends InterceptorsWrapper {
  final PreferenceManager _preferenceManager = getx.Get.find(tag: (PreferenceManager).toString());

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final customHeaders = getCustomHeaders();
    options.headers.addAll(customHeaders);
    Logger().d(customHeaders);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // final statusCode = response.statusCode;
    // final uri = response.requestOptions.uri;
    // final data = (response.data);
    // Logger().d("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    // if (response.statusCode == 401) {
    //   return handler.reject(DioException(requestOptions: response.requestOptions));
    // }
    super.onResponse(response, handler);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   if (err.response?.statusCode == 401) {
  //     AppSnackBar.showError(message: S.current.expired_session);
  //     getx.Get.offAndToNamed(Routes.LOGIN);
  //     return;
  //   }
  //   super.onError(err, handler);
  // }

  Map<String, String> getCustomHeaders() {
    final String accessToken = _preferenceManager.getString(PreferenceManager.keyToken);
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
